#CLASS {buyarmor} open
#ALIAS            {@buy_armor}            {#if {$doing_buy=="on"} {#list list_armor GET $buyindex tmp;buy $tmp} {#var doing_buy "on";#var buyindex 1;#list list_armor LEN buycount;#alias @doing_buy @buy_armor;@buy_armor}}  {5}
#ALIAS            {@buying_done}          {#if {$doing_buy=="on" && $buyindex<$buycount} {#math buyindex $buyindex+1;@doing_buy} {#var doing_buy "off"}}  {5}
#ALIAS            {@doing_buy}            {@buy_armor}                 {5}
#VARIABLE         {buycount}              {8}
#VARIABLE         {buyindex}              {8}
#VARIABLE         {doing_buy}             {"on"}
#VARIABLE         {list_armor}            {{gloves} {boots} {waist} {wrists} {shield} {surcoat} {neck-cycle} {helmet}}
#class {buyarmor} close
