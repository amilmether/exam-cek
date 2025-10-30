#include <stdio.h>
#include <string.h>
#include <stdlib.h>
void main()
{
    FILE *fp1;
    char line[50], staddr[20], name[20], name1[20];
    int staddr1, i, j;

    fp1 = fopen("objectcode.txt", "r");

    printf("enter the name: ");
    scanf("%s", name);
    fscanf(fp1, "%s", line);

    for (i = 2, j = 0, i < 8; j < 6; i++, j++)
        name1[j] = line[i];
    name1[j] = '\0';
    printf("NAME %s\n", name1);

    if (strcmp(name, name1) == 0)
    {
        while (fscanf(fp1, "%s", line) == 1)
        {
            if (line[0] == 'T')
            {
                for (i = 2, j = 0, i < 8; j < 6; i++, j++)
                    staddr[j] = line[i];
                staddr[j] = '\0';
                staddr1 = (atoi(staddr));
                i = 12;
                while (line[i] != '$')
                {
                    if (line[i] != '^')
                    {
                        printf("00%d \t\t%c%c\n", staddr1, line[i], line[i + 1]);
                        i = i + 2;
                        staddr1++;
                    }
                    else
                    {
                        i++;
                    }
                }
            }
            else if (line[0] == 'E')
            {
                printf("JUMP TO EXECUTION %s", &line[2]);
                return;
            }
        }
    }
}