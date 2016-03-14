# compile icsharp (the awb version)

# packages directory needs to be created manually because otehrwise nuget doesnot work

cd /home/condauser/icsharp \
 && . /opt/mono/env.sh \
 && mkdir /home/condauser/icsharp/packages \  
 && mono ./.nuget/NuGet.exe restore ./icSharp.sln \
 && xbuild ./iCSharp.sln /property:Configuration=Release /nologo /verbosity:normal

#Executable is under:  /home/condauser/icsharp/Kernel/bin/Release
# mono Kernel/bin/Release/iCSharp.Kernel.exe     will show the aruments not provided; the compilation of iCSharp worked.
