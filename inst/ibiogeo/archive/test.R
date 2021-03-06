library(ecoevoapps)
library(tidyverse)
# INPUT
D = c(1,4) # distances from mainland (km)
A = c(1,.5) # island size (km^2)
M = 100 # number of species in the mainland
k = 0.015 # scaling constant

# FUNCTIONS
#I = function(S){exp(-k*(S-M))-1} # immigration rate: number of new species arriving per year
#E = function(S){exp(k*S)-1} # extinction rate: number of species being lost per year
I = function(S,D){exp(-(k/D)*(S-M))-1} # immigration rate: number of new species arriving per year
E = function(S,A){exp(k*A*S)-1} # extinction rate: number of species being lost per year
Sx = function(D,A){M/(D*A+1)} # number of species at equilibrium
Ix = function(D,A){exp(-(k/D)*(Sx(D,A)-M))-1} # immigration rate at equilibrium
Ex = function(D,A){exp(k*A*Sx(D,A))-1} # extinction rate at equilibrium

### PLOTS
## Map
plot(1:10,type="n",xaxt="n",ylab="Distance from the mainland (km)",ylim=c(-1,9),xlab="")
# Mainland
tx = c(0.6487523,1.0551068,1.5239774 ,1.8365578,2.2116542,2.5242346,3.3056856,4.2434268,5.0248778,5.4624904,6.0563931,6.6190378,7.3067147,7.3067147,7.2129406,7.5255210,8.1506818,9.1509390,9.9323900,10.2449704,15)
ty = c(-0.002336449 ,0.207943925,0.278037383 ,0.278037383,0.067757009,-0.107476636,-0.352803738,-0.212616822,-0.037383178,0.067757009,0.137850467 ,0.242990654,0.242990654,0.242990654,-0.072429907,-0.282710280,-0.247663551,-0.107476636,-0.142523364,-0.212616822,0)
polygon(x=c(tx,rev(tx)),y=c(ty,rep(-3,length(ty))),lwd=2,density=10)
# Island A
tx = c(-1.98662207 ,-1.91715976 ,-1.63931052 ,-1.29199897, -1.04888089,-1.01414973,-0.94468742 ,-0.63210702 ,-0.38898894, -0.21533316,-0.11113970,0.09724723  ,0.34036532  ,0.68767687,  1.03498842,1.24337535,1.45176228  ,1.76434268  ,1.72961153,  1.52122459,1.34756882,1.27810651  ,1.34756882  ,1.41703113,  1.41703113,1.13918189,0.86133265  ,0.79187034  ,0.51402110,  0.34036532,0.23617185,0.09724723 ,-0.11113970 ,-0.25006432, -0.38898894,-0.56264471,-0.70156933, -0.94468742, -1.11834320, -1.56984821,-1.98662207)
ty = c(-0.007009346,  0.273364486,  0.658878505,  0.799065421,  0.974299065, 1.184579439,  1.394859813,  1.535046729,  1.535046729,  1.394859813, 1.149532710,  1.114485981,  1.149532710,  1.184579439,  0.904205607, 0.764018692,  0.764018692,  0.553738318,  0.238317757,  0.203271028, 0.098130841, -0.042056075, -0.217289720, -0.532710280, -0.707943925,-0.988317757, -0.988317757, -0.988317757, -0.918224299, -1.058411215,-1.408878505, -1.408878505, -1.408878505, -1.268691589, -0.988317757,-0.848130841, -0.848130841, -0.883177570, -0.637850467, -0.532710280,-0.007009346)
polygon(x=sqrt(A[1])*tx+3,y=sqrt(A[1])*ty+D[1]-sqrt(A[1])*min(ty),lwd=3)
text(x=3,y=D[1]-sqrt(A[1])*min(ty),"A",font=2)
# Island B
#tx = c(0.02778492, -0.25006432, -0.56264471, -0.59737587, -1.01414973,-1.46565475, -1.46565475, -1.43092359, -1.88242861, -1.60457937,-1.43092359, -1.46565475, -1.53511706, -1.56984821, -1.32673013,-1.01414973, -0.90995626, -0.90995626, -0.59737587, -0.45845125,-0.42372009, -0.11113970,  0.20144070,  0.44455879  ,0.44455879, 0.86133265,  1.00025727,  1.34756882,  1.41703113  ,1.45176228, 1.48649344,  1.20864420,  1.00025727,  0.93079496  ,0.89606380, 0.86133265,  0.58348341,  0.44455879,  0.20144070  ,0.02778492)
#ty = c(-1.40887850, -1.33878505, -1.30373832, -0.88317757, -0.81308411,-0.81308411, -0.67289720, -0.53271028, -0.35747664, -0.07710280, 0.06308411,  0.23831776  ,0.34345794  ,0.55373832,  0.72897196, 0.72897196,  0.90420561  ,0.97429907  ,0.93925234,  1.11448598, 1.39485981,  1.64018692  ,1.64018692  ,1.42990654,  1.11448598, 0.79906542,  0.79906542  ,0.65887850  ,0.34345794,  0.02803738,-0.11214953, -0.28738318, -0.32242991, -0.63785047, -0.98831776,-1.23364486, -1.30373832, -1.16355140, -1.09345794, -1.40887850)
tx=-tx; ty=-ty
polygon(x=sqrt(A[2])*tx+8,y=sqrt(A[2])*ty+D[2]-sqrt(A[2])*min(ty),lwd=3)
text(x=8,y=D[2]-sqrt(A[2])*min(ty),"B",font=2)


tx = c(0.6487523,1.0551068,1.5239774 ,1.8365578,2.2116542,2.5242346,3.3056856,4.2434268,5.0248778,5.4624904,6.0563931,6.6190378,7.3067147,7.3067147,7.2129406,7.5255210,8.1506818,9.1509390,9.9323900,10.2449704,15)
ty = c(-0.002336449 ,0.207943925,0.278037383 ,0.278037383,0.067757009,-0.107476636,-0.352803738,-0.212616822,-0.037383178,0.067757009,0.137850467 ,0.242990654,0.242990654,0.242990654,-0.072429907,-0.282710280,-0.247663551,-0.107476636,-0.142523364,-0.212616822,0)
txa = c(-1.98662207 ,-1.91715976 ,-1.63931052 ,-1.29199897, -1.04888089,-1.01414973,-0.94468742 ,-0.63210702 ,-0.38898894, -0.21533316,-0.11113970,0.09724723  ,0.34036532  ,0.68767687,  1.03498842,1.24337535,1.45176228  ,1.76434268  ,1.72961153,  1.52122459,1.34756882,1.27810651  ,1.34756882  ,1.41703113,  1.41703113,1.13918189,0.86133265  ,0.79187034  ,0.51402110,  0.34036532,0.23617185,0.09724723 ,-0.11113970 ,-0.25006432, -0.38898894,-0.56264471,-0.70156933, -0.94468742, -1.11834320, -1.56984821,-1.98662207)
tya = c(-0.007009346,  0.273364486,  0.658878505,  0.799065421,  0.974299065, 1.184579439,  1.394859813,  1.535046729,  1.535046729,  1.394859813, 1.149532710,  1.114485981,  1.149532710,  1.184579439,  0.904205607, 0.764018692,  0.764018692,  0.553738318,  0.238317757,  0.203271028, 0.098130841, -0.042056075, -0.217289720, -0.532710280, -0.707943925,-0.988317757, -0.988317757, -0.988317757, -0.918224299, -1.058411215,-1.408878505, -1.408878505, -1.408878505, -1.268691589, -0.988317757,-0.848130841, -0.848130841, -0.883177570, -0.637850467, -0.532710280,-0.007009346)
txb=-txa; tyb=-tya


ggplot() +
  geom_polygon(aes(x = c(tx, rev(tx)), y = c(ty, rep(-3,length(ty)))), fill = "grey90",
               color = "grey10") +
  geom_polygon(aes(x = sqrt(A[1])*txa+4, y = sqrt(A[1])*tya+D[1]-sqrt(A[1])*min(tya)),
               color = colorpal[1], fill = "transparent") +
  geom_polygon(aes(x = sqrt(A[2])*txb+12, y = sqrt(A[2])*tyb+D[2]-sqrt(A[2])*min(tyb)),
                 color = colorpal[2], fill = "transparent") +
  annotate("text", x = 4, y = D[1]-sqrt(A[1])*min(tya), label = "island\nA",
           color = colorpal[1]) +
  annotate("text", x = 12, y = D[2]-sqrt(A[2])*min(tyb), label = "island\nB",
           color = colorpal[2]) +
  annotate("text", x = 7.5, y = -1 , label = "Mainland", hjust = 0, size = 6) +

  xlab("") +
  ylab("Distance from mainland (km)") +
  scale_x_continuous(expand = c(0,0)) +
  theme_apps()+
  scale_y_continuous(expand = c(0,0)) +
  theme(axis.text.x= element_blank(), axis.ticks.x = element_blank())



(ggplot(data.frame(x = c(0, M)), aes(x)) +
    stat_function(fun = I, args = list(D = D[1]), aes(color = "colorpal[1]", linetype = "1")) +
    stat_function(fun = I, args = list(D = D[2]), aes(color = "colorpal[2]", linetype = "1")) +
    stat_function(fun = E, args = list(A = A[1]), aes(color = "colorpal[1]", linetype = "2")) +
    stat_function(fun = E, args = list(A = A[2]), aes(color = "colorpal[2]", linetype = "2")) +
    ylab("Immigration or Extinction Rate\n(species/year)") +
    xlab("\nNumber of species on island") +
    geom_segment(aes(x = Sx(D[1],A[1]), xend = Sx(D[1],A[1]),
                     y = 0, yend = Ex(D[1],A[1])), color = colorpal[1], linetype = 3) +
    geom_text(x = Sx(D[1],A[1]), y = 0, vjust = 3, label = floor(Sx(D[1],A[1])), color = colorpal[1]) +
    geom_text(x = Sx(D[2],A[2]), y = 0, vjust = 3, label = floor(Sx(D[2],A[2])), color = colorpal[2]) +
    coord_cartesian(clip = "off") +
    scale_color_manual(name = " ", guide = "legend", values = colorpal, labels = c("Island A", "Island B")) +
    scale_linetype_manual(name = "", values = c(1,2), labels = c("Immigration rate", "Extinction rate")) +
    geom_segment(aes(x = Sx(D[2],A[2]), xend = Sx(D[2],A[2]),
                     y = 0, yend = Ex(D[2],A[2])), color = colorpal[2], linetype = 3) +
    theme_apps() +
    theme(legend.position = "top"))  %>%
  originator +
  NULL

## Rates
#plot(1:10,xlab="Number of species",ylab="Rate (species per year)",xaxs="i",yaxs="i",ylim=c(0,4),xlim=c(0,M),type="n")
#curve(I(S=x),from=0,to=M,col=4,add=T,lwd=2)
#curve(E(S=x),from=0,to=M,col=2,add=T,lwd=2)
#segments(x0=50,x1=50,y0=0,y1=1.117,lty=2); #segments(x0=50,x1=0,y0=1.117,y1=1.117,lty=2)
#mtext(at=50,50,side=1,font=2)
#legend("topright",bty="n",col=c(4,2),c("immigration","exticntion"),lty=1,lwd=2)
plot(1:10,xlab="Number of species",ylab="Rate (species per year)",xaxs="i",yaxs="i",ylim=c(0,4),xlim=c(0,M),type="n")
curve(I(S=x,D=D[1]),from=0,to=M,col=4,add=T,lwd=2)
curve(I(S=x,D=D[2]),from=0,to=M,col=4,add=T,lwd=2,lty=2)
curve(E(S=x,A=A[1]),from=0,to=M,col=2,add=T,lwd=2)
curve(E(S=x,A=A[2]),from=0,to=M,col=2,add=T,lwd=2,lty=2)
segments(x0=Sx(D[1],A[1]),x1=Sx(D[1],A[1]),y0=0,y1=Ex(D[1],A[1]),lty=3)
mtext(at=Sx(D[1],A[1]),round(Sx(D[1],A[1])),side=1,font=2)
segments(x0=Sx(D[2],A[2]),x1=Sx(D[2],A[2]),y0=0,y1=Ix(D[2],A[2]),lty=3)
if(!Sx(D[2],A[2])%in%seq(0,100,20)){mtext(at=Sx(D[2],A[2]),round(Sx(D[2],A[2])),side=1,font=2)}
legend("topright",bty="n",col=c(4,2,1,1),pch=c(15,15,NA,NA),pt.cex=2,c("immigration","extinction","Island A","Island B"),lty=c(NA,NA,1,2),lwd=2)








