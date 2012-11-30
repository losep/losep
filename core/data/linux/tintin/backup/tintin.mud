#CONFIG           {SPEEDWALK}             {OFF}
#CONFIG           {VERBATIM}              {OFF}
#CONFIG           {REPEAT ENTER}          {OFF}
#CONFIG           {ECHO COMMAND}          {ON}
#CONFIG           {VERBOSE}               {OFF}
#CONFIG           {WORDWRAP}              {ON}
#CONFIG           {LOG}                   {RAW}
#CONFIG           {BUFFER SIZE}           {5000}
#CONFIG           {SCROLL LOCK}           {ON}
#CONFIG           {HISTORY SIZE}          {1000}
#CONFIG           {CONNECT RETRY}         {60}
#CONFIG           {PACKET PATCH}          {0}
#CONFIG           {TINTIN CHAR}           {#}
#CONFIG           {VERBATIM CHAR}         {\\}
#CONFIG           {REPEAT CHAR}           {!}
#CONFIG           {CONVERT META}          {OFF}
#ALIAS            {@addpath}              {#pathdir %1 %2;#pathdir %2 %1}  {5}
#ALIAS            {@closeclass}           {#class %1 close}  {5}
#ALIAS            {@fromfile}             {#read $global_filename}     {5}
#ALIAS            {@killclass}            {#class %1 kill}             {5}
#ALIAS            {@new_ss}               {#math session_count $session_count+1;#session $session_name$session_count localhost 6666}  {5}
#ALIAS            {@openclass}            {#class %1 read $script_path/tt_%1.mud;#class %1 open}  {5}
#ALIAS            {@reopenclass}          {@killclass %1;@openclass %1}  {5}
#ALIAS            {@saveclass}            {#class %1 write $script_path/tt_%1.mud}  {5}
#ALIAS            {@screen}               {#split 0 3}                 {5}
#ALIAS            {@tofile}               {#write $global_filename}    {5}
#VARIABLE         {global_filename}       {/share/etc/tintin.mud}
#VARIABLE         {script_path}           {/share/etc}
#VARIABLE         {session_name}          {local}
#PATHDIR          {d}                     {u}
#PATHDIR          {e}                     {w}
#PATHDIR          {ed}                    {wu}
#PATHDIR          {eu}                    {wd}
#PATHDIR          {n}                     {s}
#PATHDIR          {nd}                    {su}
#PATHDIR          {ne}                    {sw}
#PATHDIR          {nu}                    {sd}
#PATHDIR          {nw}                    {se}
#PATHDIR          {s}                     {n}
#PATHDIR          {sd}                    {nu}
#PATHDIR          {se}                    {nw}
#PATHDIR          {su}                    {nd}
#PATHDIR          {sw}                    {ne}
#PATHDIR          {u}                     {d}
#PATHDIR          {w}                     {e}
#PATHDIR          {wd}                    {eu}
#PATHDIR          {wu}                    {ed}
