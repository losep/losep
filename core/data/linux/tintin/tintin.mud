#ALIAS            {6666}                  {#sess l6666 localhost 6666}  {5}
#ALIAS            {@add}                  {#math %1 $%1+1}             {5}
#ALIAS            {@addpath}              {#pathdir %1 %2;#pathdir %2 %1}  {5}
#ALIAS            {@autosess}             {#math session_count $session_count+1;#session $session_name$session_count localhost 6666}  {5}
#ALIAS            {@backupclass}          {#system makebak $script_path/tt_%1.mud}  {5}
#ALIAS            {@closeclass}           {#class %1 close}            {5}
#ALIAS            {@fromfile}             {#read $global_filename}     {5}
#ALIAS            {@getclasspath}         {#var curclass $script_path/tt_%1.mud}  {5}
#ALIAS            {@killclass}            {#class %1 kill}             {5}
#ALIAS            {@openclass}            {#class %1 open}             {5}
#ALIAS            {@readclass}            {#class %1 read $script_path/tt_%1.mud}  {5}
#ALIAS            {@reduce}               {#math %1 $%1-1}             {5}
#ALIAS            {@reloadclass}          {@killclass %1;@readclass %1}  {5}
#ALIAS            {@saveclass}            {#if {$save_backup==1} {@backupclass %1};#class %1 write $script_path/tt_%1.mud}  {5}
#ALIAS            {@screen}               {#split 0 3}                 {5}
#ALIAS            {@switch}               {#if { $%1 == "off"} {#var %1 "on"} {#var %1 "off"};#showme {%1=$%1} {4}}  {5}
#ALIAS            {@tofile}               {#write $global_filename}    {5}
#ALIAS            {@xyj}                  {#math session_count $session_count+1; #session xyj$session_count $xyj_ip $xyj_port}  {5}
#CONFIG           {BUFFER SIZE}           {5000}
#CONFIG           {CONNECT RETRY}         {60}
#CONFIG           {CONVERT META}          {OFF}
#CONFIG           {ECHO COMMAND}          {ON}
#CONFIG           {HISTORY SIZE}          {1000}
#CONFIG           {LOG}                   {RAW}
#CONFIG           {PACKET PATCH}          {0}
#CONFIG           {REPEAT CHAR}           {!}
#CONFIG           {REPEAT ENTER}          {OFF}
#CONFIG           {SCROLL LOCK}           {ON}
#CONFIG           {SPEEDWALK}             {OFF}
#CONFIG           {TINTIN CHAR}           {#}
#CONFIG           {VERBATIM}              {OFF}
#CONFIG           {VERBATIM CHAR}         {\\}
#CONFIG           {VERBOSE}               {OFF}
#CONFIG           {WORDWRAP}              {ON}
#PATHDIR          {d}                     {u}                          {0}
#PATHDIR          {e}                     {w}                          {0}
#PATHDIR          {ed}                    {wu}                         {0}
#PATHDIR          {eu}                    {wd}                         {0}
#PATHDIR          {n}                     {s}                          {0}
#PATHDIR          {nd}                    {su}                         {0}
#PATHDIR          {ne}                    {sw}                         {0}
#PATHDIR          {nu}                    {sd}                         {0}
#PATHDIR          {nw}                    {se}                         {0}
#PATHDIR          {s}                     {n}                          {0}
#PATHDIR          {sd}                    {nu}                         {0}
#PATHDIR          {se}                    {nw}                         {0}
#PATHDIR          {su}                    {nd}                         {0}
#PATHDIR          {sw}                    {ne}                         {0}
#PATHDIR          {u}                     {d}                          {0}
#PATHDIR          {w}                     {e}                          {0}
#PATHDIR          {wd}                    {eu}                         {0}
#PATHDIR          {wu}                    {ed}                         {0}
#VARIABLE         {global_filename}       {/myplace/appdata/tintin/tintin.mud}
#VARIABLE         {save_backup}           {0}
#VARIABLE         {script_path}           {/myplace/appdata/tintin}
#VARIABLE         {session_count}         {0}
#VARIABLE         {session_name}          {local}
#VARIABLE         {xyj_ip}                {localhost}
#VARIABLE         {xyj_port}              {6666}
