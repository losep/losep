#CLASS {dazuo} OPEN

#ALIAS            {@do_dazuo}             {dazuo 10}                   {5}
#ALIAS            {@do_drink}             {#10 drink wan;#10 eat tao;n;@do_dazuo}  {5}
#ALIAS            {@done_wakeup}          {#if {$s_shiwu<$min_food||$s_yinshui<$min_food} {@get_food} {@do_dazuo}}  {5}
#ALIAS            {@food_is_here}         {s}                          {5}
#ALIAS            {@get_food}             {@food_is_here;@do_drink}    {5}
#ALIAS            {@wakeup}               {hp;#delay 1 {@done_wakeup}}  {5}
#ACTION           {你运功完毕，深深吸了口气，站了起来。}  {hp;#delay 1 {#if {$s_qi>$min_qi} {@do_dazuo} {sleep}}}  {5}

#CLASS {dazuo} CLOSE
