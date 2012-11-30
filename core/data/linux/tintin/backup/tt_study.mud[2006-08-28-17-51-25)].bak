#CLASS {study} OPEN

#ALIAS            {@be_tire}              {skills;sleep}               {5}
#ALIAS            {@do_drink}             {#10 drink wan;#10 eat tao;n;@do_study}  {5}
#ALIAS            {@do_study}             {study $study_book 1}        {5}
#ALIAS            {@done_study}           {@do_study}                  {5}
#ALIAS            {@done_wakeup}          {#if {$s_shiwu<$min_food||$s_yinshui<$min_food} {@get_food} {@do_study}}  {5}
#ALIAS            {@food_is_here}         {s}                          {5}
#ALIAS            {@get_food}             {@food_is_here;@do_drink}    {5}
#ALIAS            {@wakeup}               {hp;#delay 1 {@done_wakeup}}  {5}
#VARIABLE         {min_food}              {20}

#CLASS {study} CLOSE
