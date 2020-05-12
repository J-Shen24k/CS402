#include <stdio.h>
#include "readfile.h"
#include <string.h>
#include <ctype.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#define MAX 1024
#define MAXFN 64
#define MAXLN 64
FILE* f;
FILE* ff;
//create a struct array
struct person
{
    int sixdigid;
    char fname[MAXFN];
    char lname[MAXLN];
    int salary;
};


struct tuple{
    int i;
    int salary;
};


void swap_person (struct person* p1, struct person* p2) {
    struct person temp = *p1;
    *p1 = *p2;
    *p2 = temp;
}



int main(int argc, char** argv) {
    if (argc >= 2) {
        char *filename = argv[1];
        int ret = open_file(argv[1]);
        if (ret != 0) {
            printf("Cannot open file %s!\n", filename);
            return -1;
        }
    }

    f = fopen(argv[1],"r+");
    struct person* p = malloc(sizeof(struct person) * MAX);
    int i = 0;
    if(f != NULL) {
        while (!feof(f) ) {
            fscanf(f, "%d %s %s %d",
                   &(p[i].sixdigid),
                   p[i].fname,
                   p[i].lname,
                   &(p[i].salary));
            i++;
        }
    }
    else{
        perror("FP ERROR: ");
        printf("sndskadasd");
    }
    int wht;
    for (i = 0; i < sizeof(struct person); i++) {
        if(p[i].sixdigid == 0){
            break;
        }
        wht++;
    }
    for (i = 0; i < wht; i++) {
        for (int j = i + 1; j < wht; j++) {
            if (p[i].sixdigid > p[j].sixdigid) {
                swap_person(&p[i], &p[j]);
            }
            else if(p[i].sixdigid == 0){
                break;
            }
        }
    }
    fclose(f);
    int qq;
    bool run = false;
    printf("SasASADSADSDASD\n");
    while(!run) {
//        int wht;
//        for (i = 0; i < sizeof(struct person); i++) {
//            if(p[i].sixdigid == 0){
//                break;
//            }
//            wht++;
//        }
//        for (i = 0; i < wht; i++) {
//            for (int j = i + 1; j < wht; j++) {
//                if (p[i].sixdigid > p[j].sixdigid) {
//                    swap_person(&p[i], &p[j]);
//                }
//                else if(p[i].sixdigid == 0){
//                    break;
//                }
//            }
//        }
        int new = p[wht-1].sixdigid;
//        printf("%d\n",wht);
        printf("                            \n");
        printf("                            \n");
        printf("                            \n");
        printf("Employee DB Menu: \n");
        printf("--------------------------\n");
        printf("(1) Print the Database\n");
        printf("(2) Lookup by ID\n");
        printf("(3) Lookup by Last Name\n");
        printf("(4) Add an Employee\n");
        printf("(5) Quit\n");
        printf("(6) Remove an Employee\n");
        printf("(7) Update an employee's information\n");
        printf("(8) Print the M employees with the highest salaries\n");
        printf("(9) Find all employees with matching last name\n");
        printf("--------------------------\n");
        printf("Enter your choice: ");
        int q = read_int(qq);
        switch (q) {
            case 1:
                printf("ID\t     Fname\t     Lname\t    Salary\n");
                for (i = 0; i < wht; i++) {
                    if (p[i].sixdigid == 0){
                        break;
                    }
                    printf("%-8d %-10s  %-10s %-10d\n",p[i].sixdigid,p[i].fname,p[i].lname,p[i].salary);
                }
                printf("Number of Employees (%d)\n",i);
                run = false;
                break;
            case 2:
                printf("Enter a 6 digit employee id:");
                int ii;
                int cyt = read_int(ii);
                if (cyt < 100000 || cyt > 999999) {
                    printf("Please follow the rules which is six digit ID value must be between 100000 and 999999.\n");
                    break;
                }
                else {
                    int l = 0;
                    int r = wht-1;
                    int mid;
                    while(l <= r)
                    {
                        mid = (l+r)/2;
                        if(p[mid].sixdigid == cyt)
                        {
                          printf("%-8d %-10s  %-10s %-10d\n",p[mid].sixdigid,p[mid].fname,p[mid].lname,p[mid].salary);
                            break;
                        }
                        else if (p[mid].sixdigid < cyt)
                        {
                            l = mid + 1;
                        }
                        else
                        {
                            r = mid - 1;

                        }

                        if(l > r)
                            printf("The target employee is not in the array.\n");

                    }
                }
                    break;

            case 3:;
                char s[64];
                printf("Please enter name: ");
                scanf("%s",s);
                read_string(s);
//                printf("%s\n",s);
                int j = strlen(s);
                wht = 0;
                for (i = 0; i < sizeof(struct person); i++) {
                    if(p[i].sixdigid == 0){
                        break;
                    }
                    wht++;
                }
                int re;
                for (i = 0; i < wht; i++) {
                    if (strcmp(s,p[i].lname)==0){
                        printf("We found it.\n");
                        printf("%-8d %-10s  %-10s %-10d\n",p[i].sixdigid,p[i].fname,p[i].lname,p[i].salary);
                        re = 2;
                        break;
                    }
                }
                if(!re == 2) {
                    printf("Not found it.\n");
                }
                break;
            case 4:
                ff = fopen(argv[1],"a+");
                printf("----------------------\n");
                int sa;
                int sa1;
                int ww;
                int www;
                wht =0;
                for (i = 0; i < sizeof(struct person); i++) {
                    if(p[i].sixdigid == 0){
                        break;
                    }
                    wht++;
                }
//                printf("%d\n",wht);
                while(!run) {
                    printf("Enter the salary 30000--150000:\n");
                    sa1 = read_int(sa);
                    if (sa1<30000 || sa1>150000){
                        printf("Please follow the instructions.\n");
                    }
                    else{
                        break;
                    }
                }
                printf("Enter the fname:\n");
                char f[64];
                scanf("%s",f);
                read_string(f);
                printf("Enter the lname:\n");
                char l[64];
                scanf("%s",l);
                read_string(l);
                printf("do you want to add the following employee to the DB?\n");
                int new1 = new +1;
                printf("%-10d %-8s% -8s %d\n",new1,f,l,sa1);
                printf("Enter 1 for yes, 0 for no: ");
                www = read_int(ww);
                if (www == 1){
                    p[wht].sixdigid = new1;
                    strcpy(p[wht].lname, l);
                    strcpy(p[wht].fname, f);
                    p[wht].salary= sa1;
                    fprintf(ff,"\n%d %s %s %d",new1,f,l,sa1);
                }
                else if (www == 0){}
                else{
                    printf("Sorry please follow the rules.");
                }
                fclose(ff);
                break;
            case 5:
                printf("Goodbye!");
                run = true;
                break;
            case 6:
                printf("Please enter the id number which you want to delete:\n ");
                int m;
                int n;
                n = read_int(m);
                printf("Do you want to delete this employee's information?\n");
                char choice[10];
                scanf("%s",choice);
                if (strcmp(choice,"yes")==0){
                    for (int i = 0; i < wht; i++) {
                        if (p[i].sixdigid==n) {
                            printf("%d\n",i);
                            for (int j = i; j < wht-1; j++) {
                                p[j].sixdigid = p[j+1].sixdigid;
                                strcpy(p[j].lname, p[j+1].lname);
                                strcpy(p[j].fname, p[j+1].fname);
                                p[j-1].salary = p[j].salary;
                            }
                            wht = wht -1;
                        }
                    }
                }

                else if(strcmp(choice,"no")==0){
                    printf("Okay. Gonna back to menu.");
                }
                else{
                    printf("Sorry. Back to menu.");
                }
                break;
            case 7:
                printf("Enter the employee id: ");
                int y;
                int z;
                int count=0;
                z = read_int(y);
                for (int i=0; i<wht; i++){
                    if(p[i].sixdigid==z){
                        printf("We found it.\n");
                        break;
                    }
                    count++;
                }
                printf("Do you wanna change the lname of employee?\n");
                char aa[64];
                scanf("%s",aa);
                if (strcmp(aa,"yes")==0){
                    printf("Please enter the new lname: \n");
                    char bb[64];
                    scanf("%s",bb);
                    read_string(bb);
                    strcpy(p[count].lname, bb);;
                }
                else{
                    printf("Back to menu.");
                }
                break;
            case 8:
                printf("Please enter the number of employees with the highest salaries you want: \n");
                int input;
                input = read_int(input);
                printf("%d\n",input);
                struct tuple* g = malloc(sizeof(struct tuple) * MAX);
                for (int i=0; i<wht; i++){
                    g[i].salary = p[i].salary;
                    g[i].i = i;
                }
//                for (int i=0; i<wht; i++){
//                    printf("%d %d\n",g[i].i,g[i].salary);
//                }
//                printf("-----------------------------\n");
                for (i = 0; i < wht; i++) {
                    for (int j = i + 1; j < wht; j++) {
                        if (g[i].salary < g[j].salary) {
                            int temp = g[i].i;
                            g[i].i = g[j].i;
                            g[j].i = temp;
                            int tmp = g[i].salary;
                            g[i].salary = g[j].salary;
                            g[j].salary = tmp;
                        }
                        else if(g[i].salary == 0){
                            break;
                        }
                    }
                }
//                for (int l=0; l<wht; l++){
//                    printf("%d %d\n",g[l].i,g[l].salary);
//                }
//                printf("------------------------------\n");
                for (int k=0; k<input; k++){
                    printf("%-8d %-10s  %-10s %-10d\n",p[g[k].i].sixdigid,p[g[k].i].fname,p[g[k].i].lname,p[g[k].i].salary);
                }
                break;
            case 9:
                printf("Please enter the lname: \n");
                char cc[64];
                scanf("%s",cc);
                read_string(cc);
                for (i = 0; i < wht; i++) {
                    if (strcasecmp(cc,p[i].lname)==0){
                        printf("%-8d %-10s  %-10s %-10d\n",p[i].sixdigid,p[i].fname,p[i].lname,p[i].salary);
                    }
                }
                break;
            default:
                printf("Hey, your input is not between 1 and 5, try again...\n");
                printf("Please follow the instructions!!!!!\n");
                //run = false;
                break;

        }
    }
    free(p);
    return 0;
}

