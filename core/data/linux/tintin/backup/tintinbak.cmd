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
#VAR {global_filename} {/share/etc/tt_global.mud} 
#ALIAS            {@addpath}              {#pathdir %1 %2;#pathdir %2 %1}  {5}
#ALIAS            {@be_busy}              {#delay 1 !}                 {5}
#ALIAS            {@buy_armor}            {#if {$doing_buy=="on"} {#list list_armor GET $buyindex tmp;buy $tmp} {#var doing_buy "on";#var buyindex 1;#list list_armor LEN buycount;#alias @doing_buy @buy_armor;@buy_armor}}  {5}
#ALIAS            {@cmd_to_target}        {#var tmp %1;#loop {$target_begin_index $target_end_index} {$tmp $target &0}}  {5}
#ALIAS            {@doing_buy}            {@buy_armor}                 {5}
#ALIAS            {@duel}                 {duel;12345}                 {5}
#ALIAS            {@fromfile}             {#read $global_filename}  {5}
#ALIAS            {@guard2wd}             {su;su;su;su;sd;su;sd;su;su;su;su;s}  {5}
#ALIAS            {@new_session}          {#math session_name $session_name+1;#session $session_name localhost 6666}  {5}
#ALIAS            {@screen}               {#split 0 3}                 {5}
#ALIAS            {@show_statu}           {#showme {       经验: $exp            潜能: $point} {2}}  {5}
#ALIAS            {@switch}               {#if { $%1 == "off"} {#var %1 "on"} {#var %1 "off"}}  {5}
#ALIAS            {@tofile}               {#write $global_filename}  {5}
#ALIAS            {@unw}                  {unwield $my_weapon}         {5}
#ALIAS            {@wd2guard}             {n;nd;nd;nd;nd;nu;nd;nu;nd;nd;nd;nd}  {5}
#ALIAS            {@wd2yz}                {n;nd;nd;nd;nd;nu;nd;nu;nd;nd;nd;nd;e;ed;ed;e;e;n;nw;e;ne;e;se;e;n;n;n;n;n;n;n;n;e}  {5}
#ALIAS            {@ww}                   {wield $my_weapon}           {5}
#ALIAS            {@xrlin}                {xrlin;12345}        {5}
#ALIAS            {@xyj}                  {#SESSION xyj localhost 6666}  {5}
#ALIAS            {@yz2wd}                {w;s;s;s;s;s;s;s;s;w;nw;w;sw;w;se;s;w;w;wu;wu;w;su;su;su;su;sd;su;sd;su;su;su;su;s}  {5}
#ACTION           {$self听了$master_name的指导，似乎有些心得。}  {@learning_doned}               {5}
#ACTION           {$master_name像是受宠若惊一样，说道：请教？这怎么敢当？}  {@learning_refused}             {5}
#ACTION           {$master_name笑着说道：您见笑了，我这点雕虫小技怎够资格「指点」您什么？}  {@learning_refused}             {5}
#ACTION           {$master_name说道：您太客气了，这怎么敢当？}  {@learning_refused}             {5}
#ACTION           {^$self双手一拱，笑著说道：承让！}  {@fight_win}                 {5}
#ACTION           {^$self双手一拱，笑著说道：知道我的利害了吧！}  {@fight_win}                 {5}
#ACTION           {^$self向后一纵，恨恨地说道：君子报仇，十年不晚！}  {@fight_lost}                {5}
#ACTION           {^$self向后一纵，躬身做揖说道：阁下武艺不凡，果然高明！}  {@fight_lost}                {5}
#ACTION           {^$self向后退了几步，说道：这场比试算我输了，下回看我怎么收拾你！}  {@fight_lost}                {5}
#ACTION           {^$self向后退了几步，说道：这场比试算我输了，佩服，佩服！}  {@fight_lost}                {5}
#ACTION           {^$self哈哈大笑，说道：承让了！}  {@fight_win}                 {5}
#ACTION           {^$self对著%0说道：在下%1，领教}  {#if {#var target_name %0;#var self_name %1}  {5}
#ACTION           {^$self纵声而笑，叫道：“你运气好！你运气好！”一面身子向后跳开。}  {@fight_lost}                {5}
#ACTION           {^$self胜了这招，向后跃开三尺，笑道：承让！}  {@fight_win}                 {5}
#ACTION           {^$self脸色一寒，说道：算了算了，就当是我让你吧！}  {@fight_lost}                {5}
#ACTION           {^$self脸色微变，说道：佩服，佩服！}  {@fight_lost}                {5}
#ACTION           {^$target_name双手一拱，笑著说道：承让！}  {@fight_lost}                {5}
#ACTION           {^$target_name双手一拱，笑著说道：知道我的利害了吧！}  {@fight_lost}                {5}
#ACTION           {^$target_name向后一纵，恨恨地说道：君子报仇，十年不晚！}  {@fight_win}                 {5}
#ACTION           {^$target_name向后一纵，躬身做揖说道：阁下武艺不凡，果然高明！}  {@fight_win}                 {5}
#ACTION           {^$target_name向后退了几步，说道：这场比试算我输了，下回看我怎么收拾你！}  {@fight_win}                 {5}
#ACTION           {^$target_name向后退了几步，说道：这场比试算我输了，佩服，佩服！}  {@fight_win}                 {5}
#ACTION           {^$target_name哈哈大笑，说道：承让了！}  {@fight_lost}                {5}
#ACTION           {^$target_name纵声而笑，叫道：“你运气好！你运气好！”一面身子向后跳开。}  {@fight_win}                 {5}
#ACTION           {^$target_name胜了这招，向后跃开三尺，笑道：承让！}  {@fight_lost}                {5}
#ACTION           {^$target_name脚下一个不稳，跌在地上一动也不动了。}  {sigh}                       {5}
#ACTION           {^$target_name脸色一寒，说道：算了算了，就当是我让你吧！}  {@fight_win}                 {5}
#ACTION           {^$target_name脸色微变，说道：佩服，佩服！}  {@fight_win}                 {5}
#ACTION           {^【 食 物 】%0/%1【 潜 能 】%2}  {#var point %2}              {5}
#ACTION           {^【 饮 水 】%0/%1【 经 验 】%2}  {#var exp %2}  {5}
#ACTION           {^也许是缺乏实战经验}  {@no_exp}  {5}
#ACTION           {^你一觉醒来，只觉精力充沛。该活动一下了。}  {@wakeup}                    {5}
#ACTION           {^你今天太累了，结果什么也没有学到}  {@be_tire}                      {5}
#ACTION           {^你的「基本%0」进步了！}  {#var skill_up "%0";#if {$skill_up=="锤法"} {@hammer_up;#return};#if {$skill_up=="轻功"} {@dodge_up;#return};#if {$skill_up=="拳脚"} {@unarmed_up;#return}}  {5}
#ACTION           {^你的眼前一黑，接著什么也不知道了....}  {@be_faint}       {5}
#ACTION           {^看起来$target_name并不想跟你较量。}  {@fight_refused}             {5}
#ACTION           {你上一个动作还没有完成。}  {@be_busy}                   {5}
#ACTION           {你从%0那里买下}  {@buying_done}}  {5}
#ACTION           {你向%0请教了}  {#var master_name %0}        {5}
#ACTION           {你的潜能不够学习这么多次了。}  {@no_point}                  {5}
#ACTION           {哟，抱歉啊，我这儿正忙着呢……您请稍候。}  {@be_busy}                   {5}
#SUBSTITUTE       {$gag_text1}            {.}
#SUBSTITUTE       {$gag_text2}            {.}
#SUBSTITUTE       {$gag_text3}            {.}
#SUBSTITUTE       {$gag_text4}            {.}
#SUBSTITUTE       {$gag_text5}            {.}
#SUBSTITUTE       {$gag_text6}            {.}
#SUBSTITUTE       {$gag_text7}            {.}
#SUBSTITUTE       {$gag_text8}            {.}
#SUBSTITUTE       {$gag_text9}            {.}
#VARIABLE         {$my_weapon}            {jitui}
#VARIABLE         {blacklist_fight}       {{^你} {^但是} {^结果}}
#VARIABLE         {buycount}              {8}
#VARIABLE         {buyindex}              {8}
#VARIABLE         {dirtytext}             {"3289#@$#@%$&^%*$&@$#@%$#VeryDirtyIndeed!$#%$#^%$&^%*&%(*!@#@!#@!"}
#VARIABLE         {doing_buy}             {"off"}
#VARIABLE         {exp}                   {5049}
#VARIABLE         {fight_for_exp}         {"off"}
#VARIABLE         {gag_text1}             {"3289#@$#@%$&^%*$&@$#@%$#VeryDirtyIndeed!$#%$#^%$&^%*&%(*!@#@!#@!"}
#VARIABLE         {gag_text2}             {"3289#@$#@%$&^%*$&@$#@%$#VeryDirtyIndeed!$#%$#^%$&^%*&%(*!@#@!#@!"}
#VARIABLE         {gag_text3}             {"3289#@$#@%$&^%*$&@$#@%$#VeryDirtyIndeed!$#%$#^%$&^%*&%(*!@#@!#@!"}
#VARIABLE         {gag_text4}             {"3289#@$#@%$&^%*$&@$#@%$#VeryDirtyIndeed!$#%$#^%$&^%*&%(*!@#@!#@!"}
#VARIABLE         {gag_text5}             {"3289#@$#@%$&^%*$&@$#@%$#VeryDirtyIndeed!$#%$#^%$&^%*&%(*!@#@!#@!"}
#VARIABLE         {gag_text6}             {"3289#@$#@%$&^%*$&@$#@%$#VeryDirtyIndeed!$#%$#^%$&^%*&%(*!@#@!#@!"}
#VARIABLE         {gag_text7}             {"3289#@$#@%$&^%*$&@$#@%$#VeryDirtyIndeed!$#%$#^%$&^%*&%(*!@#@!#@!"}
#VARIABLE         {gag_text8}             {"3289#@$#@%$&^%*$&@$#@%$#VeryDirtyIndeed!$#%$#^%$&^%*&%(*!@#@!#@!"}
#VARIABLE         {gag_text9}             {"3289#@$#@%$&^%*$&@$#@%$#VeryDirtyIndeed!$#%$#^%$&^%*&%(*!@#@!#@!"}
#VARIABLE         {l_status}              {{learning} {fight_for_exp} {point} {exp}}
#VARIABLE         {l_tmp}                 {4}
#VARIABLE         {learing}               {"on"}
#VARIABLE         {learn_master}          {guxu}
#VARIABLE         {learn_subject}         {parry}
#VARIABLE         {learning}              {"on"}
#VARIABLE         {list_armor}            {{gloves} {boots} {waist} {wrists} {shield} {surcoat} {neck-cycle} {helmet}}
#VARIABLE         {loop}                  {4}
#VARIABLE         {master_name}           {谷虚道长}
#VARIABLE         {my_weapon}             {jitui}
#VARIABLE         {point}                 {30}
#VARIABLE         {result}                {1}
#VARIABLE         {robot}                 {"off"}
#VARIABLE         {self}                  {你}
#VARIABLE         {self_name}             {是谁}
#VARIABLE         {session_name}          {0}
#VARIABLE         {skill_up}              {"锤法"}
#VARIABLE         {status_text}           {| learning:$learning fight_for_exp:$fight_for_exp point:$point exp:$exp}
#VARIABLE         {target}                {mu ren}
#VARIABLE         {target_begin_index}    {1}
#VARIABLE         {target_end_index}      {4}
#VARIABLE         {target_name}           {木人}
#VARIABLE         {tmp}                   {hit}
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
#CLASS            {robot_dazuo}           {open}
