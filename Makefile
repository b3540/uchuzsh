.PHONY : all clean

COMPILER = rabbit
OBJDIR   = ./pdf
SOURCES  = $(wildcard zsh_*.md)
OBJECTS  = $(addprefix $(OBJDIR)/, $(SOURCES:.md=.pdf))

all: $(OBJECTS)

$(OBJDIR)/zsh_%.pdf: zsh_%.md
	@[ -d $(OBJDIR) ] || mkdir -p $(OBJDIR)
	$(COMPILER) -p -o $@ $<

run: $(SOURCES)
	$(COMPILER) $<

clean:
	rm -f $(OBJECTS)
	@[ ! -d $(OBJDIR) ] || rmdir $(OBJDIR)

