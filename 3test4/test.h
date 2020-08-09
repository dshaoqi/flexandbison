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


