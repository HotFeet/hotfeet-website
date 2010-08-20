#LIBS=/usr/local/lib/mono/gac/HotFeet.Libs_V2/2.0.0.0__00b6d4e3e7b9cf3d/HotFeet.Libs_V2.dll
LIBS=/internal/libs2/bin/HotFeet.Libs_V2.dll

all:
	gmcs *.cs /debug /codepage:1252 /t:library /out:../bin/HotFeet.Website.dll /r:$(LIBS)
