// https://balau82.wordpress.com/2012/02/19/linking-a-binary-blob-with-gcc/
// http://ultra64.ca/files/documentation/online-manuals/man-v5-1/
// http://ultra64.ca/files/documentation/online-manuals/man-v5-1/n64man/tool/makerom.htm
// TODO: Support -h or -? parameters
#include <errno.h>
#include <process.h>
//#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
//#include <sys/types.h>
//#include <sys/wait.h>
#include <time.h> 
#include <unistd.h>

#include "makerom.h"
#define DEBUG 
//#undef DEBUG  

int conversion_int;
// String Variables
const char* define_str = "";
const char* include_str = "";
// Filename Variables
const char* bootstrap_file = "Boot";
const char* romheader_file = "romheader";
const char* pif_file = "pif2Boot";
const char* font_file = "font";
char* output_file = "rom";
const char* symbol_file = "";
char* spec_file = "spec";
// Directory Variables
char* directory_str = "";
char* resource_directory = "";
clock_t counter;
	
int fpeek(FILE *stream)
{
    int c;
    c = fgetc(stream);
    ungetc(c, stream);
    return c;
}

/* https://stackoverflow.com/questions/21880730/c-what-is-the-best-and-fastest-way-to-concatenate-strings */
char * mystrcat(char * dest, const char * src)
{
	while (*dest) dest++;
	while ((*dest++ = *src++));
	return --dest;
}

int exec_and_wait(char * program, char * args[])
{
	// Unix/Linux implementations will probably need fork() & execvp()
	/* https://www.gnu.org/software/libc/manual/html_node/Process-Creation-Example.html#Process-Creation-Example */
	int status = 0;
#ifdef DEBUG
	printf("\tspawning status %d\n", status);
#endif
	// https://docs.microsoft.com/en-us/cpp/c-runtime-library/spawn-wspawn-functions?view=vs-2019
	status = spawnvp(P_WAIT, program, args);
	if (status != 0)
		perror(NULL);
#ifdef DEBUG
	printf("\texecute status %d\n", status);
#endif
	return status;
}

/*
 * Check if a file exist using fopen() function
 * F_OK exists
 * R_OK read permission
 * W_OK write permission
 * X_OK execute permission
 * return true if the file exist otherwise return false
 */
bool file_exists(const char * filename, int mode)
{
#ifdef DEBUG
	printf("\tFilename : %s\n", filename);
	// -1 = Error, 0 = success
	// +=1 now ...
	// 0 = False, 1 = True
	printf("\tFile Exists: %d\n", access(filename, F_OK)+1);
	printf("\tFile Read : %d\n", access(filename, R_OK)+1);
	printf("\tFile Write : %d\n", access(filename, W_OK)+1);
	printf("\tFile Execute : %d\n", access(filename, X_OK)+1);
#endif
	return access(filename, mode) != -1;
}

/*
 * 
 *
 */
bool file_exists_path(const char * filename, int mode)
{
	return file_exists(filename, mode);
}

bool file_exists_current_dir(const char * filename, int mode)
{
	char * cwd = getcwd(NULL, 0);
	char path_and_file[PATH_MAX];
	char * full_path = path_and_file;
	path_and_file[0] = '\0';
	char * slash = "\\";
	full_path = mystrcat(full_path, cwd);
	full_path = mystrcat(full_path, slash);
	full_path = mystrcat(full_path, filename);
	
#ifdef DEBUG
	int filename_len = strlen(filename);
	int dir_len = strlen(cwd);
	printf("\tPATH MAX: %d\n", PATH_MAX);
	printf("\tFile name: %s\n", filename);
	printf("\tFile name length: %d\n", filename_len);
	printf("\tCurrent working dir: %s\n", cwd);
	printf("\tdir name length: %d\n", dir_len);
	printf("\tPath is Null %d\n", full_path == NULL);
	printf("\tFull dir and file: %s\n", path_and_file);
#endif
	return file_exists(path_and_file, mode);
}

#ifdef DEBUG
void print_segment(segment_list_t * segment)
{
	printf("\n\tSegment:\n");
	printf("\t\tname: %s\n", segment->name);
	printf("\t\taddress: %d\n", segment->address);
	printf("\t\talign: %d\n", segment->align);
	printf("\t\tflags: %d\n", segment->flags);
	printf("\t\tmaxsize: %d\n", segment->maxsize);
	printf("\t\tnumber: %d\n", segment->number);
	printf("\t\tafter: %s\n", segment->after);
	printf("\t\tentry: %s\n", segment->entry);
	printf("\t\tstack: %s\n", segment->stack);
	printf("\t\tincludes:\n");
	for(int idx = 0; idx <= SPEC_INCLUDE_MAX;idx++)
	{
		if (segment->include[idx][0] != '\0')
			printf("\t\t\t %s\n", segment->include[idx]);
	}
	printf("\t\tnext: %p\n", (void *)segment->next);
}
#endif

void usage(char *exeName)
{
	printf("usage:%s [option(s)] specfile\r\n", exeName);
	printf("64DD\r\n");
	printf("\t-DD64         : set DD64 mode (makedisk mode)\r\n");
	printf("\t-t<disktype>  : set disk type ( Only use DD64 mode )\r\n");
	printf("Passed to gcc\r\n");
	printf("\t-Dname[=def]  : passed to cpp for use during its invocation\r\n");
	printf("\t-Idirectory   : passed to cpp for use during its invocation\r\n");
	printf("\t-Uname        : passed to cpp for use during its invocation\r\n");
	printf("Flags\r\n");
	printf("\t-d            : debug mode ( don't remove temporary files )\r\n");
	printf("\t-E            : link error(undef. symbol) stop mode\r\n");
	printf("\t-m            : print a link editor map to stdout\r\n");
	printf("\t-o            : provided for compatibility with other tools\r\n");
	printf("\t-w            : disable overlay warning display\r\n");
	printf("Files\r\n");
	printf("\t-b<filename>  : set bootstrap file     [Boot]\r\n");
	printf("\t-h<filename>  : set romheader file     [romheader]\r\n");
	printf("\t-p<filename>  : set pif bootstrap file [pif2Boot]\r\n");
	printf("\t-F<filename>  : set font file          [font]\r\n");
	printf("\t-L<directory> : set resource directory [/usr/lib/PR]\r\n");
	printf("\t-r<filename>  : set output file        [rom]\r\n");
	printf("\t-e<filename>  : set output symbol file\r\n");
	printf("\t@<filename>   : specify indirect file \r\n");
	printf("Options\r\n");
	printf("\t-s<romsize>   : set minimum rom size (Mbits)\r\n");
	printf("environment\r\n");
	printf("\tMILD_OPT      : passed to ld\r\n");
	printf("\tGCCDIR        : tool directory $(GCCDIR)/mipse/bin\r\n");
	printf("\tTEMP          : temporary directory\r\n");
}

void exit_pgm(bool hard_exit, int status)
{
	counter = clock() - counter;
	double time_taken = ((double)counter)/CLOCKS_PER_SEC; // in seconds 
	printf("Elapsed: %f seconds to execute \n", time_taken); 
	if (hard_exit)
	{
		printf("Failed\n");
		exit(status);
	}
}

int remove_quotes(char * src, char * dest)
{	
	int didx = 0;
	for (int idx = 0; idx <= (int)strlen(src);idx++)
	{
		if (src[idx] != '"' && src[idx] != '\0')
		{
			dest[didx] = src[idx];
			didx++;
		}
	}
#ifdef DEBUG
	printf("\tDe-quoted string: %s\n", dest);
#endif
	return strlen(dest);
}

int parse_spec_file()
{
	int result = 0;
	// TODO:
	// 	Tokenize spec_file
	char scan_str[6];
	int scan_length = SPEC_VAL_MAXCHAR;
	sprintf(scan_str, "  %d ", scan_length);
	scan_str[1] = '%';
	if (scan_length > 99)		
		scan_str[5] = 's';
	else if (scan_length < 99)
		scan_str[4] = 's';	
	
#ifdef DEBUG
	printf("\tWord Scan Format: %s\n", scan_str);
#endif
	segment_list_t * curr_seg;

	#ifdef DEBUG
	printf("\tSegment Struct Size: %d\n", (int)sizeof(segment_list_t));
	printf("\tWave Struct Size: %d\n", (int)sizeof(wave_list_t));
	#endif

	char x[SPEC_VAL_MAXCHAR + 1];
	FILE *spec = fopen("spec.out", "r");
	while (fscanf(spec, scan_str, x) == 1)
	{
		bool word_processed = false;
		if (strncmp(x, "beginseg", 8) == 0)
		{
			//if (parsed_spec.segment_list == NULL)
			//{
				curr_seg = calloc(sizeof(segment_list_t), 1);
			//}
			//else (curr_seg != NULL && curr_seg.next == NULL)
			//{
//				curr_seg = calloc(sizeof(segment_list_t), 2);
			//}
			//else
//				printf("Linked List Error curr_seg: %p curr_seg->next: %p", curr_seg, curr_seg->next):
			
			int include_idx = 0;
			int word_found = fscanf(spec, scan_str, x);
			while (word_found && strncmp(x, "endseg", 6) != 0)
			{
				if (strncmp(x, "name", 4) == 0)
				{					
					if (fscanf(spec, scan_str, x))
					{
						word_processed = false;
						// Remove Quotes
						char * trimmed = calloc(SPEC_VAL_MAXCHAR, 1);
						remove_quotes(x, trimmed);
						if (strlen(trimmed) > 0)
						{
							// Assign the Name to the struct
							memcpy(curr_seg->name, trimmed, SPEC_VAL_MAXCHAR);							 
							word_processed = true;
						}
						free(trimmed);
					}					
				}
				else if (strncmp(x, "flags", 5) == 0)
				{
					word_processed = true;
					while (fscanf(spec, scan_str, x))
					{
						word_processed = false;
#ifdef DEBUG
						printf("\tFlag '%s'\n", x);
#endif
						// TODO: Handle Multiple flags
						if (strncmp(x, "BOOT", 4) == 0)
						{
							// Assign value to the struct
							curr_seg->flags |= BOOT;
						}
						else if (strncmp(x, "OBJECT", 6) == 0)
						{
							// Assign value to the struct
							curr_seg->flags |= OBJECT;
						}
						else if (strncmp(x, "RAW", 3) == 0)
						{
							// Assign value to the struct
							curr_seg->flags |= RAW;
						}
						else
						{
#ifdef DEBUG
							// These are now being recognized by other code
							//printf("\tUnrecognized Flag '%s'\n", x);
#endif
							break;
						}
					}
				}
				else if (strncmp(x, "entry", 5) == 0)
				{
					word_processed = true;
					if (fscanf(spec, scan_str, x))
					{
						word_processed = false;
						// Remove Quotes
						char * trimmed = calloc(SPEC_VAL_MAXCHAR, 1);
						remove_quotes(x, trimmed);
						if (strlen(trimmed) > 0)
						{
							// Assign the Name to the struct
							memcpy(curr_seg->entry, trimmed, SPEC_VAL_MAXCHAR);							 
							word_processed = true;
						}
						free(trimmed);
					}					
				}
				else if (strncmp(x, "stack", 5) == 0)
				{
					word_processed = true;
					// Remove Quotes
					// Assign the Name to the struct
					// Support mulitple parameters
				}
				else if (strncmp(x, "include", 7) == 0)
				{
					if (fscanf(spec, scan_str, x))
					{
						// Remove Quotes
						char * trimmed = calloc(SPEC_VAL_MAXCHAR, 1);
						remove_quotes(x, trimmed);
						if (strlen(trimmed) > 0)
						{
							// Assign the Name to the struct						
							memcpy(curr_seg->include[include_idx], trimmed, SPEC_VAL_MAXCHAR);
							include_idx++;
							word_processed = true;
						}
						free(trimmed);					
					}
				}
				else if (strncmp(x, "number", 6) == 0)
				{					
					if (fscanf(spec, scan_str, x))
					{
						conversion_int = atoi(x);
						if (conversion_int > 0)
						{							
							// Assign the Name to the struct
							curr_seg->number = conversion_int;
							word_processed = true;
						}
					}					
				}
				else if (strncmp(x, "align", 5) == 0)
				{
					word_processed = true;
					// Remove Quotes
					// Assign the Name to the struct
				}
				else if (strncmp(x, "maxsize", 7) == 0)
				{
					if (fscanf(spec, scan_str, x))
					{
						conversion_int = atoi(x);
						if (conversion_int > 0)
						{							
							// Assign the Name to the struct
							curr_seg->maxsize = conversion_int;
							word_processed = true;
						}
					}					
				}
				else if (strncmp(x, "after", 5) == 0)
				{
					word_processed = true;
					// Remove Quotes
					// Assign the Name to the struct
				}
				else
					printf("\tUnimplemented segment word: %s\n", x);
				if (word_processed)
					word_found = fscanf(spec, scan_str, x);
			}
#ifdef DEBUG
			print_segment(curr_seg);
#endif
			// Don't Free curr_seg it should get added to a global variable for the following phases.
		}
		else if (strncmp(x, "beginwave",9) == 0)
		{
			int word_found = fscanf(spec, scan_str, x);
			while (word_found && strncmp(x, "endwave", 7) != 0)
			{
				word_processed = true;
				if (strncmp(x, "name", 4) == 0)
				{
					word_processed = true;
					if (fscanf(spec, scan_str, x))
					{
						word_processed = false;
						char * trimmed = calloc(SPEC_VAL_MAXCHAR, 1);
						// Remove Quotes
						remove_quotes(x, trimmed);
						if (strlen(trimmed) > 0)
						{
							// Assign the Name to the struct
							word_processed = true;
						}
						free(trimmed);
					}					
				}
				else if (strncmp(x, "include", 7) == 0)
				{
					word_processed = true;
					if (fscanf(spec, scan_str, x))
					{
						word_processed = false;
						char * trimmed = calloc(SPEC_VAL_MAXCHAR, 1);
							// Remove Quotes
						remove_quotes(x, trimmed);
						if (strlen(trimmed) > 0)
						{
							// Assign the Name to the struct
							word_processed = true;
						}
						free(trimmed);
					}
				}
				else
				{
					printf("\tUnimplemented wave word: %s\n", x);
					result = -1;
				}
				if (word_processed)
					word_found = fscanf(spec, scan_str, x);
			}
		}
		else
		{
			printf("\tUnrecognized word: %s\n", x);
			result = -2;
		}
	}
	fclose(spec);
	// 	Lexical Scanner spec_file
	// 	Parse Tree spec_file
	return result;
}

int create_cmd_file()
{
	int result = -1;
	
	return result;
}
// ErrorLevel's
// -1 Invalid Argument
// 0 Success
// 1 Missing value for Argument
// 2 Value out of range
// 3 File Missing
int main(int argc, char *argv[])
{
	int return_value = 0;
	arg_struct.fill_byte = 0x0;
	counter = clock();
	
	printf("Inspired By:\r\n");
	printf("\t'rom image link editor version 1.01 (gcc32) Copyright (c) 1997 Hudson/KMC'\r\n");

#ifdef DEBUG
	printf("\targc %d\n", argc);
	if (argc == 1)
		printf("\targ0 %s\n", argv[0]);
#endif
	if (argc == 1) // Program Name is 0 element
	{
		usage(argv[0]);
		counter = clock() - counter;
		double time_taken = ((double)counter)/CLOCKS_PER_SEC; // in seconds 
		printf("Elapsed: %f seconds to execute \n", time_taken); 
		return 0;		
	}
	
	int opt;
	while((opt = getopt(argc, argv, ":b:B:dD:e:Ef:F:h:I:L:mo:p:r:s:t:U:w")) != -1)  
    {  
#ifdef DEBUG
		printf("\topt: %c\r\n", opt);
		printf("\toptind: %d\r\n", optind);
		printf("\toptarg: %s\r\n", optarg);
		printf("\toptopt: %c\r\n", optopt);	
		printf("\topterr: %d\r\n", opterr);			
		arg_struct.debugMode = true; // Little bit of a cheat for testing
#endif
        switch(opt)  
        {  
			case ':':
				// getopt "trick" to return ':' when optional value is not passed with arg.
				printf("\tMissing value for parameter %c\r\n", optopt);
				return_value = 1;
				break;
			case 'b':
				// Overrides the default filename "/usr/lib/PR/Boot". This file must be in COFF format, and is loaded as 1K bytes into the ramrom memory. 
				// -b <bootstrap filename>
				bootstrap_file = optarg;
				break;
			case 'B':
				// -B 0
				// An option that concerns only games supported by 64DD. Using this option creates a startup game. For information on startup games, please see Section 15.1, "Restarting," in the N64 Disk Drive Programming Manual. 
				// Creates a so-called "activating" game.
				// -B 1
				// Creates a so-called "activated" game. For details about activating and activated games, see Chapter 15.1 "Reboot" in the 64DD Programming Manual.
				conversion_int = atoi(optarg);
				if (conversion_int < 0 || conversion_int > 1)
				{
					return_value = 2;
					char opt_ch = (char)opt;
					printf("\tArgument %c : Invalid value %s\n", opt_ch, optarg);
				}
				arg_struct.disk_boot_type = conversion_int;				
				break;
            case 'd': 				
				// Debug Info
				// Gives a verbose account of all the actions that makerom takes, leaving temporary files created that are normally deleted. 				
				arg_struct.debugMode = true;
				break;
			case 'D': 
				// For compatibility ignore the -DD64 parameter
				//  It doesn't do anything that -B # doesn't
				if (strcmp(optarg, "D64") == 0)
					continue;
				// Is passed to cpp for use during its invocation. 
				// -D name[=def]
				// TODO: Have to get some examples to implement correctly
                printf("option: %c \n", opt);
                break;  
			case 'e':
				// FROM: Old mild version
				// -e <filename>  : set output symbol file
				// TODO: Not sure?
				break;
			case 'E':
				// FROM: Old mild version
				// -E : link error(undef. symbol) stop mode
				// TODO: Not sure?
				arg_struct.linkError = true;
				break;
			case 'f':
				// Sets the fill pattern for "holes" within a ROM image. The argument filldata is a one-byte hexadecimal constant. Use this option when you create a ROM image using the -s option.
				// -f <filldata (0x0 - 0xff)>				
				arg_struct.fill_byte = (int)strtol(optarg, NULL, 0) & 0xFF;
				break;
			case 'F':
				// FROM: Old mild version
				// Font
				// -F <filename> : set font file [font]
				break;
			case 'h':
				// Overrides the default ROM header filename "/usr/lib/PR/romheader". This file is in ASCII format, and each character is converted to hex and loaded in sequence, starting at the beginning of ramrom memory. Currently only 32 bytes are used. 
				// -h <header filename>
				romheader_file = optarg;
				break;
			case 'i':
				// -i idfile
				// Specifies the ID file. When this option is specified, makedisk outputs gwrite (mentioned later) so that the first 32 bytes of idfile are written to the disk as the ID.
				// TODO: Nice feature but not many examples
				break;
            case 'I':  
				// Is passed to cpp for use during its invocation.
				// -I directory
                printf("directory: %s\n", optarg);  
                break;  
            case 'm': 
				// Prints a link editor map to standard output for diagnostic purposes. 
				arg_struct.mapFile = true;
				break;
            case 'o': 
				// Disables checking of overlapping sections. By default, segments with direct-mapped CPU addresses are checked to ensure that the underlying physical memory mappings do not conflict. 
				break;
			case 'p':
				// Overrides the pif bootstrap filename "/usr/lib/PR/pif2Boot". This file must be in COFF format. It is loaded as 4K bytes into the ramrom memory. 
				// -p <pif bootstrap file>
				break;
			case 'r':
				// Provides an alternate ROM image file; the default is 'rom'.
				// -r <rom image file>
				break;
			case 's':
				// Creates a ROM image with the specified size. This option is required for making the real Game Pak. 
				// -s <romsize (Mbits)>
				conversion_int = atoi(optarg);
				if (conversion_int < 0 || conversion_int > 256)
				{
					return_value = 2;
					char opt_ch = (char)opt;
					printf("\tArgument %c : Invalid value %s\n", opt_ch, optarg);
				}
				arg_struct.size = conversion_int;
				break;
			case 't':
				// ultra64.ca/files/documentation/online-manuals/man-v5-1/64ddman/dd11/11-05.htm
				conversion_int = atoi(optarg);
				if (conversion_int < 0 || conversion_int > 6)
				{					
					return_value = 2;
					char opt_ch = (char)opt;
					printf("\tArgument %c : Invalid value %s\n", opt_ch, optarg);
				}
				arg_struct.disk_type = conversion_int;
				break;
            case 'U':  
				// Is passed to cpp for use during its invocation.
				// -U name                
                break;  
			case 'w':
				break;
			case '?': // User asked for Usage Text
			default:            
				if (opt != '?')				
				{
					printf("unknown option: %c\n", opt); 					
					if (optarg != NULL)
						printf("unknown value: %s\r\n", optarg);					
				}
				return_value = -1;
				
                break;  
        }  
    }  
	//when some extra arguments are passed
	// For our case only 1 extra argument is supported
	// for(; optind < argc; optind++){ //when some extra arguments are passed
	//		printf("Given extra arguments: %s\n", argv[optind]);
	if(optind < argc) 
	{
		spec_file = argv[optind];			
		//if (!file_exists_current_dir(spec_file, R_OK))
	}

	if (!file_exists_current_dir(spec_file, R_OK))
	{
		return_value = 3;
		printf("File not found %s\n", spec_file);
	}
	if (!file_exists(romheader_file, R_OK))
	{
		return_value = 3;
		printf("File not found %s\n", romheader_file);
	}
	if (file_exists(output_file, F_OK))
		if (!file_exists(output_file, W_OK))
		{
			return_value = 3;
			printf("File not writable %s\n", output_file);
		}
	// TODO: The bootstrap, pif and font file are in some other folder
	if (!file_exists(bootstrap_file, R_OK))
	{
		return_value = 3;
		printf("File not found %s\n", bootstrap_file);
	}
	if (!file_exists(pif_file, R_OK))
	{
		return_value = 3;
		printf("File not found %s\n", pif_file);
	}
	if (!file_exists(font_file, R_OK))
	{
		return_value = 3;
		printf("File not found %s\n", font_file);
	}
		
	// Any of the parameters are invalid exit here.
	if (return_value != 0)
	{
		usage(argv[0]);	
		counter = clock() - counter;
		double time_taken = ((double)counter)/CLOCKS_PER_SEC; // in seconds 
		printf("Elapsed: %f seconds to execute \n", time_taken); 		
		return return_value;
	}
	
	// Parameters are good, now start doing some work.
	if (arg_struct.debugMode)
	{
		printf("%s: using rom header: %s\n",argv[0], romheader_file);
		printf("%s: using pif2Boot: %s\n",argv[0], pif_file);
		printf("%s: using font file: %s\n",argv[0], font_file);
		printf("%s: using boot strap: %s\n",argv[0], bootstrap_file);
		printf("%s: using spec file: %s\n",argv[0], spec_file);
		printf("%s: using output file: %s\n",argv[0], output_file);
	}
	
	// https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/4/html/Using_the_GNU_Compiler_Collection/preprocessor-options.html
	char * cppArgs[8];
	cppArgs[0] = "cpp";
	cppArgs[1] = "-E"; // use the -E option, nothing is done except preprocessing.
	cppArgs[2] = "-D LANGUAGE_MAKEROM"; // Special Define
	cppArgs[3] = "-P"; // Inhibit generation of linemarkers in the output from the preprocessor.
	cppArgs[4] = "-x c"; 
	cppArgs[5] = "-o spec.out"; // TODO: Need the output filename
	cppArgs[6] = &spec_file[0];
	cppArgs[7] = '\0';
	if (arg_struct.debugMode)
	{
		//Show command to Execute the cpp compiler to preprocess any headers		
		printf("%s: ",argv[0]);		
		for(long long unsigned idx = 0; idx < 8; idx++)
		{
			if (cppArgs[idx] != NULL)
				printf("%s ", cppArgs[idx]);
		}
		printf("\n");		
	}
	// Execute the cpp compiler to preprocess any headers
	int cppResult = exec_and_wait("cpp", cppArgs);	
	if (cppResult != 0)
	{
#ifdef DEBUG
		printf("Spec file result: %d\n", cppResult);
#endif
		// Fail and Exit Now?
		exit_pgm(true, cppResult);
	}
	
	// Create Command File
	if (arg_struct.debugMode)
	{
		printf("%s: creating command file\n", argv[0]);
	}
	int createCmdResult = create_cmd_file();
	if (createCmdResult != 0)
	{
#ifdef DEBUG
		printf("Create Command result: %d\n", createCmdResult);
#endif
		// Fail and Exit Now?
		exit_pgm(true, createCmdResult);
	}
	int parseResult = parse_spec_file();
	if (parseResult != 0)
	{
#ifdef DEBUG
		printf("Spec file result: %d\n", parseResult);
#endif
		// Fail and Exit Now?
		exit_pgm(true, cppResult);
	}
	
	// TODO:
	// Execute Link Editor 
	if (arg_struct.debugMode)
	{
		printf("%s: execute link editor\n", argv[0]);
	}
	
	// run linker
	char * ldArgs[6];
	ldArgs[0] = "ld";
	ldArgs[1] = "-G 0 -noinhibit-exec -T";
	ldArgs[2] = "rom_link.cmd";
	ldArgs[3] = "-o";
	ldArgs[4] = &output_file[0];
	ldArgs[5] = '\0';
	if (arg_struct.debugMode)
	{
		printf("%s: ",argv[0]);		
		for(long long unsigned idx = 0; idx < 8; idx++)
		{
			if (ldArgs[idx] != NULL)
				printf("%s ", ldArgs[idx]);
		}
		printf("\n");		
	}
	int ldResult = exec_and_wait("ld", ldArgs);
	if (ldResult != 0)
	{
#ifdef DEBUG
		printf("Linker result: %d\n", ldResult);
#endif
		// Fail and Exit Now?
		exit_pgm(true, ldResult);
	}

	// TODO:
	// run command file
	if (arg_struct.debugMode)
	{
	}

	// TODO:
	// generate entry source code.
	if (arg_struct.debugMode)
	{
		printf("%s: creating entry source\n", argv[0]);
	}

	// TODO:
	// assemble entry source code.
	char * asArgs[4];
	asArgs[0] = "as";
	asArgs[1] = "-non_shared";
	asArgs[2] = "entry.s";
	asArgs[3] = '\0';
	if (arg_struct.debugMode)
	{
		printf("%s: ",argv[0]);		
		for(long long unsigned idx = 0; idx < 8; idx++)
		{
			if (asArgs[idx] != NULL)
				printf("%s ", asArgs[idx]);
		}
		printf("\n");		
		printf("%s: assemble entry source\n", argv[0]);
	}
	int asResult = exec_and_wait("as", asArgs);
	if (asResult != 0)
	{
		// Fail and Exit Now?
		exit_pgm(true, asResult);
	}

	// TODO:
	// create rom image
	if (arg_struct.debugMode)
	{
		printf("%s: %s -R %s -o %s\n", argv[0], "ls", output_file, "a.out");
	}

	// TODO:
	// 	write out romheader
	if (arg_struct.debugMode)
	{
		printf("%s: writing %s\n", argv[0], romheader_file);
	}

	// TODO:
	//	write bootstrap
	if (arg_struct.debugMode)
	{
		printf("%s: writing %s\n", argv[0], bootstrap_file);
	}

	// TODO:
	//	write font
	if (arg_struct.debugMode)
	{
		printf("%s: writing %s\n", argv[0], font_file);
	}

	// TODO:
	//	write entry object
	if (arg_struct.debugMode)
	{
	}

	// TODO:
	//	write code object
	if (arg_struct.debugMode)
	{
	}
	
	if (!arg_struct.debugMode)
	{
		// TODO:
		// Delete Temporary Files
	}
	printf("Complete\n");
	exit_pgm(false, return_value);
	return return_value;
}