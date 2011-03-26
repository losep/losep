var source = new String(WScript.ScriptFullname);
var i = source.lastIndexOf("\\");
if (i > 0) {
	source_dir = source.substr(0,i);
}
else {
	source_dir = WScript.CurrentDirectory;
}

//WScript.Echo(source_dir);
var WshShell = WScript.CreateObject("WScript.Shell");


function create_link(filename,target_name,args,icon,desc) {
	var oShellLink = WshShell.CreateShortcut(source_dir + "\\" + filename);
	oShellLink.TargetPath = source_dir + "\\" + target_name;
	oShellLink.WindowStyle = 0;
	oShellLink.Arguments = args;
	oShellLink.WorkingDirectory = source_dir;
	oShellLink.IconLocation = icon;
	oShellLink.Description = "MyPlace Shell Launcher";
	oShellLink.Save();
}

create_link('Shell.lnk','Start.vbs','','cmd.exe, 0','MyPlace Shell');
create_link('Power Shell.lnk','Start.vbs','New-Shell.ps1','powershell.exe, 0','MyPlace Power Shell');
create_link('Cygwin Shell.lnk','Start.vbs', 'Shell.bat cygwin.bat', source_dir + '\\system\\cygwin\\cygwin.ico','MyPlace Cygwin Shell');
create_link('Total Commander.lnk','Start.vbs','Shell.bat totalcmd.bat', source_dir + '\\system\\app\\totalcmd\\totalcmd.exe, 0', 'Total Commander');







