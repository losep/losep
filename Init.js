var source = new String(WScript.ScriptFullname);
var i = source.lastIndexOf("\\");
if (i > 0) {
	source_dir = source.substr(0,i);
}
else {
	source_dir = WScript.CurrentDirectory;
}

WScript.Echo(source_dir);

var filename = 'Shell.lnk';
var target_name = 'Start.vbs';
//var icon = '%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe, 0';
var icon = 'powershell.exe, 0';


var WshShell = WScript.CreateObject("WScript.Shell");
var oShellLink = WshShell.CreateShortcut(source_dir + "\\" + filename);
oShellLink.TargetPath = source_dir + "\\" + target_name;
oShellLink.WindowStyle = 0;
oShellLink.IconLocation = icon;
oShellLink.Description = "MyPlace Shell Launcher";
oShellLink.Save();



