#CLASS {wdguard} OPEN

#ALIAS            {@do_eat}               {@guard2wd;e;e;s;#8 eat tao;#5 drink wan;n;w;w;@wd2guard;@do_jobs}  {5}
#ALIAS            {@do_jobs}              {@start_guard}               {5}
#ALIAS            {@do_learn}             {@to_master;@saveclass wdguard;@killclass wdguard;@readclass learn;@do_learning}  {5}
#ALIAS            {@do_perform}           {perform chan}               {5}
#ALIAS            {@start_guard}          {volunteer}                  {5}
#ALIAS            {@to_jobs}              {@wd2guard}                  {5}
#ALIAS            {@to_master}            {@guard2wd}                  {5}
#ALIAS            {@wakeup}               {hp;#delay 1 @wakeup_done}   {5}
#ALIAS            {@wakeup_done}          {@check_food;@check_point;#delay 1 @wakeup_switch}  {5}
#ALIAS            {@wakeup_switch}        {#if {$must_eat==1} {@do_eat;#return};#if {$must_learn==1} {@do_learn;#return};@do_jobs}  {5}
#ACTION           {你上一个动作还没有完成，不能施用外功。}  {#delay 1 @do_perform}       {5}
#ACTION           {你使出太极剑法「缠」字诀，剑意圈转}  {#delay 1 @do_perform}       {5}
#ACTION           {你在武当山门值守期已满。}  {#4 {get corpse;e;drop corpse;w;};@wakeup}  {5}
#ACTION           {山下突然冲上来一伙蒙面大汉。}  {halt;yun recover;kill dahan;@do_perform}  {5}
#ACTION           {目前正自顾不暇，放胆攻击吧}  {#delay 1 @do_perform}       {5}

#CLASS {wdguard} CLOSE
