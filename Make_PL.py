def MAKE_TAG(S,REP,TAG="_TAG_"):
        if(TAG==None):
                TAG="_TAG_"
        #very weak tag finding and high chance of false positives
        return S.replace(TAG,REP)
def MAKE_PL(S):
	S=S.replace("'","''")
	S=S.split("\n")
	S2=""
	str=""
	for l in S:
		if len(l)==0:
			continue
		if l[0]!="-":
			str+=l+"\n"
	S=("BEGIN \n\n")
	for c in str.split(";"):
		if len(c)<=2:
			continue
		S+=("EXECUTE IMMEDIATE \' "+c+"\';\n\n")
	S+=("END;")
	return S
def Proces(name,REP,PL=False,TAG=None):
	'''Takes a normal sql file and applies some procesing functions on it
    MAKE_TAG : replaces the TAG(def: "_TAG_") with REP
    MAKE_PL:    every SQL command put in an PLSQL anonymous block
	IN:  NAME.sql
	OUT: NAME_PR.sql '''
	I=open(name+".sql","r")
	O=open(name+"_PR.sql","w")

	S=I.read()


	S=MAKE_TAG(S,REP,TAG)

	if(PL):
		S=MAKE_PL(S)

	O.write(S)

	I.close()
	O.close()
def Merge(*F,Name="Build_script",REP,PL=False,TAG=None):
        S=""
        for f in F:
                I=open(f+".sql")
                S+=I.read()
                I.close()
        S=MAKE_TAG(S,REP,TAG)

        O=open(REP+Name+".sql","w")
        O.write(S)
        O.close
        
F=True
#Proces("Albion2D","S28_",F)
#Proces("DROP","S28_",F)
#Proces("Albion2D_Insert","S28_",False)
#Proces("MKPL","S28_",F)
Merge("Albion2D","Insert","Demo","Market",REP="")
Merge("DROP",Name="Drop_Script",REP="")

