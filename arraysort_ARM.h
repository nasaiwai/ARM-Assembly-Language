/*
 * Header file for CSE 30 HW2. Include this header file in the arraysort.c file.
 * DO NOT CHANGE any of the function signatures
 */

struct List {
    int* sortedList;
    int size;
    int maxSize;
};

typedef struct List list;

/**
 * This function creates an empty list, with space allocated for an array of
 * maxElements ints (pointed to by int *sortedList) and returns a pointer to the
 * list.
 */
list* createlist_ARM(int maxElements);

/**
 * This function takes a pointer to the list and an integer value as input. It
 * should insert the value 'val' into sortedList, update the number of elements
 * in the list and return the index where the element was inserted. If the list
 * is full before inserting the element, it should increase the size of the list
 * to double its previous size and then insert the element. If the result of the
 * insert was not successful it should return -1. Note that the resulting list
 * should be sorted and there should be no information loss. The function should
 * return -1 if no valid list was passed to it.
 */
int insert_ARM(list *ls, int val);

/**
 * This function takes a pointer to the list and an integer value as input. It
 * should delete all instances of elements in the sortedList with value 'val',
 * update the number of elements remaining in the list and return the number of
 * elements that were deleted. Once again the resulting list should be sorted.
 */
int remove_val_ARM(list *ls, int val);

/**
 * This function takes a pointer to the the list as input and returns the
 * maximum value in the list OR -1 if the list is empty.
 */
int get_max_ARM(list *ls);

/**
 * This function takes a pointer to the list and returns the minimum value in
 * the list OR -1 if the list is empty.
 */
int get_min_ARM(list *ls);

/**
 * This function returns the index of the first occurrence of 'val' in the
 * list. It returns -1 if the value 'val' is not present in the list.
 */
int search_ARM(list *ls, int val);

/**
 * This function returns the minimum value from the list and removes it from the
 * list. It returns -1 if the list is empty.
 */
int pop_min_ARM(list *ls);

/**
 * This function print the contents of the sorted list on a single line as follows:
 * 1 4 6 7 8
 */
void print_ARM(list *ls);
