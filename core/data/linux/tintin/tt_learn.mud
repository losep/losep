#CLASS {learn} OPEN

#ALIAS            {@be_tire}              {skills;sleep}               {5}
#ALIAS            {@close_self}           {@killclass learn}           {5}
#ALIAS            {@do_learning}          {learn $learn_master $learn_subject 1}  {5}
#ALIAS            {@do_recover}           {yun recover}                {5}
#ALIAS            {@learning_done}        {@do_learning}               {5}
#ALIAS            {@learning_refused}     {give 50 silver to $learn_master}  {5}
#ALIAS            {@no_money}             {s;w;n;w;qu 20 gold}         {5}
#ALIAS            {@no_point}             {@close_self;@readclass $cur_class;@to_jobs;@do_jobs}  {5}
#ALIAS            {@start_learn}          {@do_learning}               {5}
#ALIAS            {@wakeup}               {@do_learning}               {5}
#ACTION           {你从身上取出十八两黄金，换成了一千八百两白银。}  {#delay 10 {e;s;e;n;@do_learning}}  {5}
#ACTION           {你从银号里取出十八两黄金。}  {#delay 5 convert 18 gold to silver}  {5}
#ACTION           {你拿出%0给$master_name。}  {@do_learning}               {5}
#ACTION           {你没有那么多的白银。}  {@no_money}                  {5}
#ACTION           {你的动作还没有完成，不能移动。}  {@be_busy}                   {5}
#VARIABLE         {learn_master}          {song}
#VARIABLE         {learn_subject}         {force}
#VARIABLE         {master_name}           {宋远桥}

#CLASS {learn} CLOSE
