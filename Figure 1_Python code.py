# Libraries
import matplotlib.pyplot as plt
import matplotlib as mpl
mpl.rcParams['font.size'] = 26.0
mpl.rcParams['font.family'] = "Arial"
 
# Make data: I have 3 groups and 7 subgroups
group_names=['Resin production,\n1,085 Mt, 56%', 'Conversion,\n535 Mt, 30%', 'End-of-life,\n161 Mt, 9%']
group_size=[1085,535,161]

subgroup_names=['PP&A, 214 Mt', 'PP, 135 Mt', 'PUR, 132 Mt', 'L/LLDPE, 126 Mt', 'PET, 110 Mt', 'HDPE, 101 Mt', 'PS, 88 Mt', 'PVC, 79 Mt', 'Additives, 55 Mt','Others, 45 Mt',
	'PP&A, 159 Mt', 'PP, 93 Mt', 'L/LLDPE, 70 Mt', 'HDPE, 58 Mt', 'PUR, 32 Mt', 'PS, 31 Mt', 'PET, 27 Mt', 'PVC, 23 Mt', 'Additives, 26 Mt','Others, 17 Mt',
	 'Incineration, 96 Mt', 'Recycling, 49 Mt', 'Landfill, 16 Mt']
subgroup_size=[214,135,132,126,110,101,88,79,55,45,159,93,70,58,32,31,27,23,26,17,96,49,16]
 
# Create colors
a, b, c=[plt.cm.Blues, plt.cm.Reds, plt.cm.Greens]
 
# First Ring (inside)
fig, ax = plt.subplots()
ax.axis('equal')
mypie1, _ = ax.pie(group_size, radius=1.2, colors=[a(0.6), b(0.6), c(0.6)])
plt.setp(mypie1, width=0.3, edgecolor='white')
 
# Second Ring (outside)
mypie2, _ = ax.pie(subgroup_size, radius=1.2+0.3, labels=subgroup_names, labeldistance=1.03, colors=[a(1.0), a(0.9), a(0.8), a(0.7), a(0.6), a(0.5), a(0.4), a(0.3), a(0.2), a(0.1), b(1.0), b(0.9), b(0.8), b(0.7), b(0.6), b(0.5), b(0.4), b(0.3), b(0.2), b(0.1), c(0.6), c(0.5), c(0.4)])
plt.setp(mypie2, width=0.3, edgecolor='white')
plt.margins(0,0) 

ax.annotate('Global life cycle GHG emissions\nfrom plastics in 2015,\n1,781 Mt $\mathregular{CO_{2}}$eq', 
			xy=(0, 0), 
			xytext=(0, 0), 
			horizontalalignment='center',
            verticalalignment='center',
			weight="bold",
			fontsize=28)
			

ax.annotate('Resin production,\n1,085 Mt, 61%', xy=(0,0), xytext=(-0.2, 0.63), horizontalalignment='center', verticalalignment='center', fontsize=28)
ax.annotate('Conversion,\n535 Mt, 30%', xy=(0,0), xytext=(0, -0.77), horizontalalignment='center', verticalalignment='center', fontsize=28)
ax.annotate('End-of-life,\n161 Mt, 9%', xy=(0,0), xytext=(0.63, -0.22), horizontalalignment='center', verticalalignment='center', fontsize=28)			

# show it

plt.show()
