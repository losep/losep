#CLASS {practice} OPEN

#ALIAS            {@do_drink}             {#10 drink wan;#10 eat tao;n;@do_practice}  {5}
#ALIAS            {@do_practice}          {practice $skill_base 1}     {5}
#ALIAS            {@done_wakeup}          {#if {$s_shiwu<$min_food||$s_yinshui<$min_food} {@get_food} {@do_practice}}  {5}
#ALIAS            {@food_is_here}         {s}                          {5}
#ALIAS            {@get_food}             {@food_is_here;@do_drink}    {5}
#ALIAS            {@stop_this}            {#var stop_practice 1}       {5}
#ALIAS            {@wakeup}               {hp;#delay 1 {@done_wakeup}}  {5}
#ACTION           {你的$skill_name进步了！}  {#if {$stop_practice==1} {#return};@do_practice}  {5}
#ACTION           {你的体力太低了。}  {#if {$stop_practice==1} {#return};hp;skills;sleep}  {5}
#ACTION           {你的内力不够练$skill_name。}  {#if {$stop_practice==1} {#return};hp;skills;sleep}  {5}
#VARIABLE         {skill_base}            {sword}
#VARIABLE         {skill_name}            {太极剑法}
#VARIABLE         {stop_practice}         {0}

#CLASS {practice} CLOSE
