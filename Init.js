var source = new String(WScript.ScriptFullname);
var i = source.lastIndexOf("\\");
if (i > 0) {
	source_dir = source.substr(0,i);
}
else {
	source_dir = WScript.CurrentDirectory;
}
var sbin_dir =  "core\\sbin\\";

//WScript.Echo(source_dir);
var WshShell = WScript.CreateObject("WScript.Shell");


function create_link(filename,target_name,args,icon,desc) {
	var oShellLink = WshShell.CreateShortcut(source_dir + "\\shortcuts\\" + filename);
	WScript.Echo("Creating " + source_dir + "\\shortcuts\\" + filename + "...");
	oShellLink.TargetPath = source_dir + "\\" + target_name;
	oShellLink.WindowStyle = 0;
	oShellLink.Arguments = args;
	oShellLink.WorkingDirectory = source_dir;
	oShellLink.IconLocation = icon;
	oShellLink.Description = "MyPlace Shell Launcher";
	oShellLink.Save();
}

create_link('Shell.lnk', sbin_dir + 'mpshell.exe','','cmd.exe, 0','MyPlace Shell');
create_link('Power Shell.lnk', sbin_dir + 'mpshell.exe','run pwsh.bat','powershell.exe, 0','MyPlace Power Shell');
create_link('Cygwin Shell.lnk',sbin_dir + 'mpshell.exe','run cygwin.bat', source_dir + '\\system\\cygwin\\cygwin.ico','MyPlace Cygwin Shell');
create_link('Total Commander.lnk',sbin_dir + 'mpshell.exe','run totalcmd.bat', source_dir + '\\system\\app\\fileman\\totalcmd\\totalcmd.exe, 0', 'Total Commander');







