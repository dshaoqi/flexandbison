struct structmeminfo{
        char *name;
        unsigned int type;
        struct structmeminfo *next;
};

struct structinfo{
        char *flleName;
        unsigned int lineNumber;
        struct structmeminfo *smi;
};

struct meminfo * simpletest(char *name,unsigned int type){
        struct meminfo *res=(struct meminfo *)malloc(sizeof(struct meminfo));
        res->name=name;
        res->type=type;
        res->next=NULL;
        return res;
}

