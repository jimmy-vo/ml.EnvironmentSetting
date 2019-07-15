# **Setting up Conky on Ubuntu** 

## **Goad**

Setup a monitor tool to keep track CPU, RAM, SWAP, GPU (Nvidia) temperatures and usage during the training

![alt text](/docs/Conky.png "Conky")

## **Installation:**

```
    apt install conky-all

```


## **Configuration:**

* Edit the configuration file below


```
    gedit /etc/conky/conky.conf 
```  

* Replace the content with the script below

```
alignment top_right
background = true 
border_width 1
color1 07CC0D
color2 D1E7D1
color3 FF0000
  FFFFFF
cpu_avg_samples 1
default_color D1E7D1
default_outline_color white
default_shade_color white
double_buffer yes
draw_borders no
draw_graph_borders yes
draw_outline no
draw_shades no
#gap_x 20
#gap_y 20
border_outer_margin 20
max_port_monitor_connections 64
maximum_width 500
minimum_width 500
# max_specials 512
max_user_text 16384
minimum_size 330 10
net_avg_samples 2
no_buffers yes
out_to_console no
# wm_class_name Conky
stippled_borders 2
# wn_window yes
#settings to define how to draw the window. compiz needs these settings, adjust for your WM
own_window true
own_window_class Conky
#own_window_type override
#own_window_class conky-semi
own_window_hints undecorated,below,sticky,skip_taskbar,skip_pager
own_window_transparent no
own_window_argb_visual yes
own_window_argb_value 150
update_interval 2
uppercase no
use_xft yes
xftalpha 0.8
xftfont  Bitstream Vera Sans Mono:size=9

# WIDTH = 500pixel, ${goto 270} for 2 column designs
# SMALL BAR HEIGHT: 12, LARGE GRAPH HEIGHT: 240


TEXT
${color1}${font sans-serif:bold:size=12}$nodename ${alignr}$kernel

${color3}${font sans-serif:bold:size=10}${execi 1000 cat /proc/cpuinfo | grep 'model name' | sed -e 's/model name.*: //'| uniq | cut -c 1-26} ${hr 2} ${font sans-serif:bold:size=8}
${color1}CPU1 $alignr ${color}${cpu cpu1}% $alignr ${freq (1)} MHz $alignr ${cpubar cpu1 8,60}
${color1}CPU2 $alignr ${color}${cpu cpu2}% $alignr ${freq (2)} MHz $alignr ${cpubar cpu2 8,60}
${color1}CPU3 $alignr ${color}${cpu cpu3}% $alignr ${freq (3)} MHz $alignr ${cpubar cpu3 8,60}
${color1}CPU4 $alignr ${color}${cpu cpu4}% $alignr ${freq (4)} MHz $alignr ${cpubar cpu4 8,60}
${color1}CPU5 $alignr ${color}${cpu cpu5}% $alignr ${freq (5)} MHz $alignr ${cpubar cpu5 8,60}
${color1}CPU6 $alignr ${color}${cpu cpu6}% $alignr ${freq (6)} MHz $alignr ${cpubar cpu6 8,60}
${color1}CPU7 $alignr ${color}${cpu cpu7}% $alignr ${freq (7)} MHz $alignr ${cpubar cpu7 8,60}
${color1}CPU8 $alignr ${color}${cpu cpu8}% $alignr ${freq (8)} MHz $alignr ${cpubar cpu8 8,60}

${color3}${font sans-serif:bold:size=10}RAM & SWAP ${hr 2}${font} ${font sans-serif:bold:size=8}
${color1}RAMs $alignr ${color}${memperc }% $alignr ${mem} $alignr ${membar 8,60}
${color1}Swap $alignr ${color}${swapperc}% $alignr ${swap} $alignr ${swapbar 8,60}

${color3}${font sans-serif:bold:size=10}${exec nvidia-smi --query-gpu=gpu_name --format=csv,noheader,nounits} ${hr 2} ${font sans-serif:bold:size=8}
${color1}GPU ${color} $alignr ${exec nvidia-smi | grep % | cut -c 61-63} %
${color1}VRAM ${color} $alignr ${exec nvidia-smi | grep % | cut -c 37-40} MB

${color3}${font sans-serif:bold:size=10}Temperatures ${hr 2} ${font sans-serif:bold:size=8}
${color1}Disk $alignr ${color} ${hddtemp /dev/sda} °C
${color1}CPUs $alignr ${color} ${hwmon 0 temp 1} °C
${color1}PCH  $alignr ${color} ${hwmon 1 temp 1} °C
${color1}GPU    $alignr ${color} ${execi 60 nvidia-settings -query [gpu:0]/GPUCoreTemp -t} °C
```













