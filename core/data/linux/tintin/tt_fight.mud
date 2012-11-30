#CLASS {fight} OPEN

#ALIAS            {@change_place}         {#if {$curroom==1} {#var curroom 2;@room1_to_room2} {#var curroom 1;@room2_to_room1}}  {5}
#ALIAS            {@check_change_place}   {#if {$fight_count>=$max_fight} {#var must_change_place 1} {#var must_change_place 0}}  {5}
#ALIAS            {@do_drink}             {#5 drink wan;@do_eat}       {5}
#ALIAS            {@do_eat}               {#5 eat tao;@food_to_fight}  {5}
#ALIAS            {@do_jobs}              {@fight_for_exp}             {5}
#ALIAS            {@do_learn}             {@saveclass fight;@killclass fight;@readclass learn;@start_learn}  {5}
#ALIAS            {@fight2food}           {@to_room1;s;ed;e;e;e;s}     {5}
#ALIAS            {@fight2learn}          {@to_room1;s;ed;e;}          {5}
#ALIAS            {@fight_for_exp}        {@add fight_count;@pre_fight;@fight_target;@halt_for_hit}  {5}
#ALIAS            {@fight_lost}           {@fight_win}                 {5}
#ALIAS            {@fight_target}         {@cmd_to_target fight}       {5}
#ALIAS            {@fight_to_change_place}  {@change_place;@start_fight}  {5}
#ALIAS            {@fight_to_food}        {@fight2food;@do_drink}      {5}
#ALIAS            {@fight_to_learn}       {@fight2learn;@do_learn}     {5}
#ALIAS            {@fight_win}            {#3 yun heal;yun recover;sleep}  {5}
#ALIAS            {@food2fight}           {n;w;w;w;wu;n;$to_room2}     {5}
#ALIAS            {@food_to_fight}        {@food2fight;@start_fight}   {5}
#ALIAS            {@halt_for_hit}         {halt;@pre_hit;@hit_target}  {5}
#ALIAS            {@hit_target}           {@cmd_to_target hit}         {5}
#ALIAS            {@learn2fight}          {w;wu;n;@to_room2}           {5}
#ALIAS            {@learn_to_fight}       {@learn2fight}               {5}
#ALIAS            {@pre_fight}            {@up_dodge;@up_unarmed;@up_hammer;remove all;@unw}  {5}
#ALIAS            {@pre_hit}              {wear all;@ww}               {5}
#ALIAS            {@room1_to_room2}       {s;s}                        {5}
#ALIAS            {@room2_to_room1}       {n;n}                        {5}
#ALIAS            {@start_fight}          {#var robot "on";#var cur_class fight;#var fight_count 0;@fight_for_exp}  {5}
#ALIAS            {@to_jobs}              {w;wu;n;@to_room2}           {5}
#ALIAS            {@to_master}            {@to_room1;s;ed;e}           {5}
#ALIAS            {@to_room1}             {#if {$curroom==2} {@room2_to_room1}}  {5}
#ALIAS            {@to_room2}             {#if {$curroom==2} {@room1_to_room2}}  {5}
#ALIAS            {@up_dodge}             {abandon dodge}              {5}
#ALIAS            {@up_hammer}            {abandon hammer}             {5}
#ALIAS            {@up_unarmed}           {say abandon unarmed ?}      {5}
#ALIAS            {@wakeup}               {hp;#delay 1 @wakeup_done}   {5}
#ALIAS            {@wakeup_done}          {@check_food;@check_point;@check_change_place;@wakeup_switch}  {5}
#ALIAS            {@wakeup_switch}        {#if {$must_eat==1} {@fight_to_food;#return};#if {$must_learn==1} {@fight_to_learn;#return};#if {$must_change_place==1} {@fight_to_change_place};@fight_for_exp}  {5}
#ACTION           {慢慢地你终于又有了知觉....}  {sleep}                      {5}
#VARIABLE         {curroom}               {2}
#VARIABLE         {max_fight}             {6}

#CLASS {fight} CLOSE