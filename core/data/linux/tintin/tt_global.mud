#CLASS {global} OPEN

#ALIAS            {@be_busy}              {#delay 1 !}                 {5}
#ALIAS            {@check_food}           {#if {$s_shiwu<$min_food || $s_yinshui<$min_food} {#var must_eat 1} {#var must_eat 0}}  {5}
#ALIAS            {@check_point}          {#if {$s_point>=$max_point} {#var must_learn 1} {#var must_learn 0}}  {5}
#ALIAS            {@cmd_to_target}        {#var tmp %1;#loop {$target_begin_index $target_end_index} {$tmp $target &0}}  {5}
#ALIAS            {@guard2wd}             {su;su;su;su;sd;su;sd;su;su;su;su;s}  {5}
#ALIAS            {@rideyz}               {give 1 silver to ma fu;rideyz}  {5}
#ALIAS            {@show_status}          {#showme {潜能:$s_point  经验:$s_exp(+$exp_up) 精气:$s_jingqi  精力:$s_jingli  气血:$s_qi  内力:$s_neili  食物:$s_shiwu  饮水:$s_yinshui} 2}  {5}
#ALIAS            {@unw}                  {unwield $my_weapon}         {5}
#ALIAS            {@wang2yz}              {sw;se;se;s;s;s;s;s;s;se;nw;n;s;se;s;s;e;e;e;e;e;e;e;n;e}  {5}
#ALIAS            {@wd2guard}             {n;nd;nd;nd;nd;nu;nd;nu;nd;nd;nd;nd}  {5}
#ALIAS            {@wd2wdbuy}             {n;nd;nd;nd;nd;e}            {5}
#ALIAS            {@wd2yz}                {n;nd;nd;nd;nd;nu;nd;nu;nd;nd;nd;nd;e;ed;ed;e;e;n;nw;e;ne;e;se;e;n;n;n;n;n;n;n;n;e}  {5}
#ALIAS            {@wdbuy2wd}             {w;su;su;su;su;s}            {5}
#ALIAS            {@ww}                   {wield $my_weapon}           {5}
#ALIAS            {@yz2wang}              {w;s;w;w;w;w;w;w;w;n;n;nw;n;s;se;nw;n;n;n;n;n;n;nw;nw;ne}  {5}
#ALIAS            {@yz2wd}                {w;s;s;s;s;s;s;s;s;w;nw;w;sw;w;se;s;w;w;wu;wu;w;su;su;su;su;sd;su;sd;su;su;su;su;s}  {5}
#ACTION           {$master_name像是受宠若惊一样，说道：请教？这怎么敢当？}  {#if {$robot!="on"} {#return};@learning_refused}  {5}
#ACTION           {$master_name笑着说道：您见笑了，我这点雕虫小技怎够资格「指点」您什么？}  {#if {$robot!="on"} {#return};@learning_refused}  {5}
#ACTION           {$master_name说道：您太客气了，这怎么敢当？}  {#if {$robot!="on"} {#return};@learning_refused}  {5}
#ACTION           {$self听了$master_name的指导，似乎有些心得。}  {#if {$robot!="on"} {#return};@learning_done}  {5}
#ACTION           {^$self双手一拱，笑著说道：承让！}  {#if {$robot!="on"} {#return};@fight_win}  {5}
#ACTION           {^$self双手一拱，笑著说道：知道我的利害了吧！}  {#if {$robot!="on"} {#return};@fight_win}  {5}
#ACTION           {^$self向后一纵，恨恨地说道：君子报仇，十年不晚！}  {#if {$robot!="on"} {#return};@fight_lost}  {5}
#ACTION           {^$self向后一纵，躬身做揖说道：阁下武艺不凡，果然高明！}  {#if {$robot!="on"} {#return};@fight_lost}  {5}
#ACTION           {^$self向后退了几步，说道：这场比试算我输了，下回看我怎么收拾你！}  {#if {$robot!="on"} {#return};@fight_lost}  {5}
#ACTION           {^$self向后退了几步，说道：这场比试算我输了，佩服，佩服！}  {#if {$robot!="on"} {#return};@fight_lost}  {5}
#ACTION           {^$self哈哈大笑，说道：承让了！}  {#if {$robot!="on"} {#return};@fight_win}  {5}
#ACTION           {^$self对著%0说道：在下%1，领教}  {#var target_name %0;#var self_name %1}  {5}
#ACTION           {^$self纵声而笑，叫道：“你运气好！你运气好！”一面身子向后跳开。}  {#if {$robot!="on"} {#return};@fight_lost}  {5}
#ACTION           {^$self胜了这招，向后跃开三尺，笑道：承让！}  {#if {$robot!="on"} {#return};@fight_win}  {5}
#ACTION           {^$self脸色一寒，说道：算了算了，就当是我让你吧！}  {#if {$robot!="on"} {#return};@fight_lost}  {5}
#ACTION           {^$self脸色微变，说道：佩服，佩服！}  {#if {$robot!="on"} {#return};@fight_lost}  {5}
#ACTION           {^$target_name双手一拱，笑著说道：承让！}  {#if {$robot!="on"} {#return};@fight_lost}  {5}
#ACTION           {^$target_name双手一拱，笑著说道：知道我的利害了吧！}  {#if {$robot!="on"} {#return};@fight_lost}  {5}
#ACTION           {^$target_name向后一纵，恨恨地说道：君子报仇，十年不晚！}  {#if {$robot!="on"} {#return};@fight_win}  {5}
#ACTION           {^$target_name向后一纵，躬身做揖说道：阁下武艺不凡，果然高明！}  {#if {$robot!="on"} {#return};@fight_win}  {5}
#ACTION           {^$target_name向后退了几步，说道：这场比试算我输了，下回看我怎么收拾你！}  {#if {$robot!="on"} {#return};@fight_win}  {5}
#ACTION           {^$target_name向后退了几步，说道：这场比试算我输了，佩服，佩服！}  {#if {$robot!="on"} {#return};@fight_win}  {5}
#ACTION           {^$target_name哈哈大笑，说道：承让了！}  {#if {$robot!="on"} {#return};@fight_lost}  {5}
#ACTION           {^$target_name纵声而笑，叫道：“你运气好！你运气好！”一面身子向后跳开。}  {#if {$robot!="on"} {#return};@fight_win}  {5}
#ACTION           {^$target_name胜了这招，向后跃开三尺，笑道：承让！}  {#if {$robot!="on"} {#return};@fight_lost}  {5}
#ACTION           {^$target_name脚下一个不稳，跌在地上一动也不动了。}  {#if {$robot!="on"} {#return};sigh}  {5}
#ACTION           {^$target_name脸色一寒，说道：算了算了，就当是我让你吧！}  {#if {$robot!="on"} {#return};@fight_win}  {5}
#ACTION           {^$target_name脸色微变，说道：佩服，佩服！}  {#if {$robot!="on"} {#return};@fight_win}  {5}
#ACTION           {^【 气 血 】%0/%1【 内 力 】%2/%3}  {#var s_qi %0;#var s_qi_m %1;#var s_neili %2;#var s_neili_m %3}  {5}
#ACTION           {^【 精 气 】%0/%1【 精 力 】%2/%3}  {#var s_jingqi %0;#var s_jingqi_m %1;#var s_jingli %2;#var s_jingli_m %3}  {5}
#ACTION           {^【 食 物 】%0/%1【 潜 能 】%2}  {#var s_shiwu %0;#var s_shiwu_m %1;#var s_point %2}  {5}
#ACTION           {^【 饮 水 】%0/%1【 经 验 】%2}  {#var s_yinshui %0;#var s_yinshui_m %1;#var s_exp %2;#if {$first_load==1} {#var first_load 0;#var base_exp $s_exp} {#math exp_up {$s_exp-$base_exp}};@screen;@show_status}  {5}
#ACTION           {^也许是缺乏实战经验}  {#if {$robot!="on"} {#return};@no_exp}  {5}
#ACTION           {^你一觉醒来，只觉精力充沛。该活动一下了。}  {#if {$robot!="on"} {#return};@wakeup}  {5}
#ACTION           {^你今天太累了，结果什么也没有学到}  {#if {$robot!="on"} {#return};@be_tire}  {5}
#ACTION           {^你的「基本%0」进步了！}  {#if {$robot!="on"} {#return};#var skill_up "%0";#if {$skill_up=="锤法"} {@up_hammer;#return};#if {$skill_up=="轻功"} {@up_dodge;#return};#if {$skill_up=="拳脚"} {@up_unarmed;#return}}  {5}
#ACTION           {^你的眼前一黑，接著什么也不知道了....}  {#if {$robot!="on"} {#return};@be_faint}  {5}
#ACTION           {^别急，慢慢吃，小心别噎着了。}  {#if {$robot!="on"} {#return};@be_busy}  {5}
#ACTION           {^看起来$target_name并不想跟你较量。}  {#if {$robot!="on"} {#return};@fight_refused}  {5}
#ACTION           {你上一个动作还没有完成。}  {#if {$robot!="on"} {#return};@be_busy}  {5}
#ACTION           {你从%0那里买下}  {#if {$robot!="on"} {#return};@buying_done}  {5}
#ACTION           {你向%0请教了}     {#if {$robot!="on"} {#return};#var master_name %0}  {5}
#ACTION           {你现在过于疲倦}  {@be_tire}                   {5}
#ACTION           {你的潜能不够学习这么多次了。}  {#if {$robot!="on"} {#return};@no_point}  {5}
#ACTION           {你研读了一行有关$study_subject的技巧，似乎有点心得。}  {@done_study}                {5}
#ACTION           {哟，抱歉啊，我这儿正忙着呢……您请稍候。}  {#if {$robot!="on"} {#return};@be_busy}  {5}
#VARIABLE         {$my_weapon}            {jitui}
#VARIABLE         {exp}                   {5049}
#VARIABLE         {fight_for_exp}         {"off"}
#VARIABLE         {first_load}            {1}
#VARIABLE         {loop}                  {5}
#VARIABLE         {max_point}             {82}
#VARIABLE         {min_food}              {20}
#VARIABLE         {min_qi}                {15}
#VARIABLE         {my_weapon}             {jitui}
#VARIABLE         {result}                {你研读了一行有关读书写字的技巧，似乎有点心得。}
#VARIABLE         {robot}                 {"on"}
#VARIABLE         {s_exp}                 {28297}
#VARIABLE         {s_jingli}              {0 }
#VARIABLE         {s_jingli_m}            {0 (+0)}
#VARIABLE         {s_jingqi}              {280}
#VARIABLE         {s_jingqi_m}            {280 (100%)    }
#VARIABLE         {s_neili}               {324 }
#VARIABLE         {s_neili_m}             {324 (+0)}
#VARIABLE         {s_point}               {41}
#VARIABLE         {s_qi}                  {451}
#VARIABLE         {s_qi_m}                {451 (100%)    }
#VARIABLE         {s_shiwu}               {260}
#VARIABLE         {s_shiwu_m}             {400           }
#VARIABLE         {s_yinshui}             {281}
#VARIABLE         {s_yinshui_m}           {400           }
#VARIABLE         {self}                  {你}
#VARIABLE         {self_name}             {是谁}
#VARIABLE         {shiwu}                 {255}
#VARIABLE         {shiwu_m}               {400           }
#VARIABLE         {skill_up}              {"拳脚"}
#VARIABLE         {study_book}            {jing}
#VARIABLE         {study_subject}         {道学心法}
#VARIABLE         {target}                {mu ren}
#VARIABLE         {target_begin_index}    {1}
#VARIABLE         {target_end_index}      {5}
#VARIABLE         {target_name}           {木人}
#VARIABLE         {tmp}                   {hit}
#VARIABLE         {cur_class}             {NULL}

#CLASS {global} CLOSE
