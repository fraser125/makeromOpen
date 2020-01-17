#ifndef MAKEROM_H
#define MAKEROM_H
#include <stdint.h>
#include <stdbool.h>

typedef struct arg_struct_t {
	int size;
	int disk_type;
	char disk_boot_type;
	char fill_byte;
	bool overlay_warning;
	bool dd64Mode;
	bool debugMode;
	bool linkError;
	bool mapFile;
	bool output;	
	char *includes;
	char *defines;
	char *undefines;
	char *bootstrap;
	char *romheader;
	char *pif;
	char *font;
	char *resource_dir;
	char *output_file;
	char *output_symbols;
} arg_struct_t;

struct arg_struct_t arg_struct;

// Range is 10 - 999? 
#define SPEC_VAL_MAXCHAR 30
#define SPEC_INCLUDE_MAX 10
#define SPEC_SEGMENT_MAX 10

typedef enum flags_t {
	Empty = 0,
	RAW = 1,
	BOOT = 2,
	OBJECT = 4
} flags_t;

typedef struct segment_list_t {
	int address;
	int align;	
	int flags;
	int maxsize;
	int number;

	// struct?
	char after[SPEC_VAL_MAXCHAR];	
	
	char entry[SPEC_VAL_MAXCHAR];
	char name[SPEC_VAL_MAXCHAR];
	
	char stack[SPEC_VAL_MAXCHAR*3];
	char include[SPEC_INCLUDE_MAX][SPEC_VAL_MAXCHAR];
	struct segment_list_t * next;
} segment_list_t;

typedef struct wave_list_t {
	char name[SPEC_VAL_MAXCHAR];
	char include[SPEC_INCLUDE_MAX][SPEC_VAL_MAXCHAR];
	struct wave_list_t * next;
} wave_list_t;

// Pointers to Linked Lists
typedef struct spec_file_t {
	segment_list_t * segment_list;
	wave_list_t * wave_list;
} spec_file_t;

struct spec_file_t parsed_spec;

#endif