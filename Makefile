DIR_INC		=	./include
DIR_SRC		=	./src
DIR_OBJ		=	./obj
DIR_BIN		=	./bin

CXX			=	g++
CFLAGS		=	-std=c++11 -g -Wall -I${DIR_INC} 
LDFLAGS		=	-lpthread  
LIBS		=

SRC			=	$(wildcard ${DIR_SRC}/*.cpp)
OBJ			=	$(subst src/,obj/,$(SRC:.cpp=.o))
INC_H		:=	$(shell find $(DIR_INC) -name '*.h')
INC_CPP		:=	$(shell find $(DIR_INC) -name '*.cpp')

TARGET		=	${DIR_BIN}/main

all: ${TARGET} 

${TARGET}: ${OBJ} 
	$(CXX) $< ${LDFLAGS} ${INCLUDES} -o $@

${DIR_OBJ}/%.o: ${DIR_SRC}/%.cpp ${INC_H} ${INC_CPP}
	${CXX} -c $< ${CFLAGS} -o $@

.PHONY:clean
clean:
	-rm -fr ${DIR_OBJ}/*
	-rm -fr ${DIR_BIN}/*
