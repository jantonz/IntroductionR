## Benvinguts/des a la pàgina del curs _R, visualització gràfica i Big Data_

Des d'aquí podreu seguir el curs sencer. És un bon lloc per començar a aprendre R!

Aquesta web utilitza [Markdown](https://daringfireball.net/projects/markdown/) i està penjada a [GitHub](https://github.com/jantonz/IntroductionR). Un cop completat el curs podreu proposar canvis a la web i podran ser implementats a la següent edició. En llenguatge GitHub, els vostres _commits_ podran ser _pushed_ a la _branch_ principal... ja hi arribarem!

# 0. Descàrregues
### 0.1. Programari

- **R:** [link](https://www.r-project.org/)
- **RStudio:** [link](https://www.rstudio.com/)

### 0.2. Dades

- **iris:** [link](https://github.com/jantonz/IntroductionR/blob/master/data/iris.csv?raw=true).
- **mtcars:** [link](https://github.com/jantonz/IntroductionR/blob/master/data/mtcars.txt?raw=true).
- **airports:** [link](https://raw.githubusercontent.com/jantonz/IntroductionR/master/data/airports.csv).
- **flights:** [link](https://raw.githubusercontent.com/jantonz/IntroductionR/master/data/flights.csv).

### 0.3. Cheat Sheets

- **R Base:** [link](https://github.com/jantonz/IntroductionR/blob/master/cheatsheets/base-r.pdf?raw=true)
- **dplyr:** [link](https://github.com/jantonz/IntroductionR/blob/master/cheatsheets/data-transformation.pdf?raw=true)
- **ggplot2:** [link](https://github.com/jantonz/IntroductionR/blob/master/cheatsheets/data-visualization-2.1.pdf?raw=true)

### 0.4. Exercicis

- **Exercici Vols New York 2013:** [link](https://github.com/jantonz/IntroductionR/blob/master/exercices/Exercici%20dplyr.pdf?raw=true)


# 1. Introducció a R
### 1.1. Primers passos en R (fora d'R)

Els primers passos els farem en [aquesta web](http://tryr.codeschool.com/). Es tracta d'una molt bona manera de fer els primers passos en diversos llenguatges de programació, per si després us animeu a aprendre Python, per exemple.

### 1.2. Instal·lació d'R i RStudio

Ara que hem jugat una mica i hem après els conceptes bàsics del llenguatge, els aplicarem dins l'espai de treball adequat. Per fero, primer ens descarregarem:
- [R](https://www.r-project.org/) i
- [RStudio](https://www.rstudio.com/)

La seva instal·lació és molt fàcil, i millor que es faci per ordre. La feina la farem en RStudio.

### 1.3. Primers passos en R (dins d'R)

És bon moment per provar algunes de les **funcions** que hem après. [Aquí](https://github.com/jantonz/IntroductionR/blob/master/cheatsheets/base-r.pdf?raw=true) teniu una _chuleta_ (_cheat sheet_ en anglès) amb moltes funcions per provar.

# 2. Lectura i anàlisi dades

### 2.1. Funcions bàsiques

Porvarem de llegir els següents fitxers:

- **iris:** [clica aquí](https://github.com/jantonz/IntroductionR/blob/master/data/iris.csv?raw=true).
- **mtcars:** [clica aquí](https://github.com/jantonz/IntroductionR/blob/master/data/mtcars.txt?raw=true).

Utilitzarem les funcions ```read.csv``` i ```read.table```, respectivament.

Ara podem provar d'aplicar sobre les *data.frames* algunes funcions:

```
class()
dim()
head()
tail()
View()
summary()
str()
```

### 2.2. Data _wrangling_

El paquet _dplyr_ és molt útil per manipular dades i es pot descarregar via `install.packages("dplyr")`. Recordeu de cridar-lo (`library(dplyr)`) abans d'utilitzar-lo.

Un _cheat sheet_ d'aquest paquet es troba [aquí](https://github.com/jantonz/IntroductionR/blob/master/cheatsheets/data-transformation.pdf?raw=true).

Passarem una bona estona treballant els apartats 1, 2a-c i 3a-c d'[aquest exercici](https://github.com/jantonz/IntroductionR/blob/master/exercices/Exercici%20dplyr.pdf?raw=true). Es tracta d’un exercici que ens fa treballar amb dades sobre els vols que van volar des dels aeroports JFK, LGA i EWR de Nova York l’any 2013.

# 3. Representació gràfica

Per a visualitzar dades amb R, el paquet més utilitzat és _ggplot2_. El seu _cheat sheet_ es troba [aquí](https://github.com/jantonz/IntroductionR/blob/master/cheatsheets/data-visualization-2.1.pdf?raw=true) i l'utilitzarem per acabar l'exercici anterior.

Es poden fer moltes correlacions, però recordeu que correlació no implica causalitat: [Spurious correlations](http://www.tylervigen.com/spurious-correlations). Aquí hi podeu trobar algunes informacions molt interessants, com que el consum de formatge per càpita es correlaciona en un 95% amb el nombre de persones mortes per per ofegament en els llençols. Alerta!

# 4. Següents passos

Check this out:
- [swirl](http://swirlstats.com/scn/)
- [manipulate](https://support.rstudio.com/hc/en-us/articles/200551906-Interactive-Plotting-with-Manipulate)
- [Shiny](https://shiny.rstudio.com/)
- [R Notebook](http://rmarkdown.rstudio.com/r_notebooks.html)
- [DataCamp](https://www.datacamp.com/)
- [Coursera](https://www.coursera.org/specializations/jhu-data-science)

<br><br>


_Josep Anton Mir Tutusaus. 2020 ._

<br><br>
<br><br>

-----------------------------------

#### [Aquí podeu trobar l'exercici solucionat](exercici_dplyr_i_ggplot2)

# Exercici dplyr i ggplot2

## 1. Inici 

En el context de l'exercici necessitarem els paquets ```dplyr```, ```ggplot2```, ```maps``` i ```leaflet```. Si no els tenim instal·lats, caldrà instal·lar-los.

Una manera elegant de carregar paquets i, en cas que no estiguin instal·lats, instal·lar-los, és utilitzar la següent funció:


```R
load_or_install <- function(x){
  for( i in x ){
    #  require returns TRUE invisibly if it was able to load package
    if( ! require( i , character.only = TRUE ) ){
      #  If package was not able to be loaded then re-install
      install.packages( i , dependencies = TRUE )
      #  Load package after installing
      require( i , character.only = TRUE )
    }
  }
}

```


```R
load_or_install(c("dplyr", "ggplot2", "maps", "leaflet"))
```

    Loading required package: dplyr
    
    Attaching package: ‘dplyr’
    
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    Loading required package: ggplot2
    Loading required package: maps
    Loading required package: leaflet


Ara ja tenim instal·lats i carregats tots els paquets necessaris per dur a terme l'exercici.

Cal ara llegir els fitxers de dades que necessitem. Resulta que els dos fitxers que necessitem es troben dins la carpeta "data". Això ho podem comprovar utilitzant la funció `list.files()`:


```R
list.files("data")
```


<ol class=list-inline>
	<li>'airports.csv'</li>
	<li>'flights.csv'</li>
	<li>'iris.csv'</li>
	<li>'mtcars.txt'</li>
</ol>



Efectivament, hem trobat els fitxers "airports.csv" i "flights.csv", que són els fitxers de dades que necessitem. Llegim les dades!


```R
aero <- read.table("data/airports.csv", header = TRUE, sep = ",")
vols <- read.csv("data/flights.csv")
```

Ara que hem llegit els fitxers a les variables _aero_ i _vols_, podem explorar-les una mica amb str(), head(), summary().

Les dades del fitxer d'origen no les modificarem en cap cas.


```R
head(vols, 5)
```


<table>
<thead><tr><th scope=col>X</th><th scope=col>year</th><th scope=col>month</th><th scope=col>day</th><th scope=col>dep_time</th><th scope=col>sched_dep_time</th><th scope=col>dep_delay</th><th scope=col>arr_time</th><th scope=col>sched_arr_time</th><th scope=col>arr_delay</th><th scope=col>carrier</th><th scope=col>flight</th><th scope=col>tailnum</th><th scope=col>origin</th><th scope=col>dest</th><th scope=col>air_time</th><th scope=col>distance</th><th scope=col>hour</th><th scope=col>minute</th><th scope=col>time_hour</th></tr></thead>
<tbody>
	<tr><td>1                  </td><td>2013               </td><td>1                  </td><td>1                  </td><td>517                </td><td>515                </td><td> 2                 </td><td> 830               </td><td> 819               </td><td> 11                </td><td>UA                 </td><td>1545               </td><td>N14228             </td><td>EWR                </td><td>IAH                </td><td>227                </td><td>1400               </td><td>5                  </td><td>15                 </td><td>2013-01-01 05:00:00</td></tr>
	<tr><td>2                  </td><td>2013               </td><td>1                  </td><td>1                  </td><td>533                </td><td>529                </td><td> 4                 </td><td> 850               </td><td> 830               </td><td> 20                </td><td>UA                 </td><td>1714               </td><td>N24211             </td><td>LGA                </td><td>IAH                </td><td>227                </td><td>1416               </td><td>5                  </td><td>29                 </td><td>2013-01-01 05:00:00</td></tr>
	<tr><td>3                  </td><td>2013               </td><td>1                  </td><td>1                  </td><td>542                </td><td>540                </td><td> 2                 </td><td> 923               </td><td> 850               </td><td> 33                </td><td>AA                 </td><td>1141               </td><td>N619AA             </td><td>JFK                </td><td>MIA                </td><td>160                </td><td>1089               </td><td>5                  </td><td>40                 </td><td>2013-01-01 05:00:00</td></tr>
	<tr><td>4                  </td><td>2013               </td><td>1                  </td><td>1                  </td><td>544                </td><td>545                </td><td>-1                 </td><td>1004               </td><td>1022               </td><td>-18                </td><td>B6                 </td><td> 725               </td><td>N804JB             </td><td>JFK                </td><td>BQN                </td><td>183                </td><td>1576               </td><td>5                  </td><td>45                 </td><td>2013-01-01 05:00:00</td></tr>
	<tr><td>5                  </td><td>2013               </td><td>1                  </td><td>1                  </td><td>554                </td><td>600                </td><td>-6                 </td><td> 812               </td><td> 837               </td><td>-25                </td><td>DL                 </td><td> 461               </td><td>N668DN             </td><td>LGA                </td><td>ATL                </td><td>116                </td><td> 762               </td><td>6                  </td><td> 0                 </td><td>2013-01-01 06:00:00</td></tr>
</tbody>
</table>




```R
str(vols)
```

    'data.frame':	200000 obs. of  20 variables:
     $ X             : int  1 2 3 4 5 6 7 8 9 10 ...
     $ year          : int  2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 ...
     $ month         : int  1 1 1 1 1 1 1 1 1 1 ...
     $ day           : int  1 1 1 1 1 1 1 1 1 1 ...
     $ dep_time      : int  517 533 542 544 554 554 555 557 557 558 ...
     $ sched_dep_time: int  515 529 540 545 600 558 600 600 600 600 ...
     $ dep_delay     : int  2 4 2 -1 -6 -4 -5 -3 -3 -2 ...
     $ arr_time      : int  830 850 923 1004 812 740 913 709 838 753 ...
     $ sched_arr_time: int  819 830 850 1022 837 728 854 723 846 745 ...
     $ arr_delay     : int  11 20 33 -18 -25 12 19 -14 -8 8 ...
     $ carrier       : Factor w/ 16 levels "9E","AA","AS",..: 12 12 2 4 5 12 4 6 4 2 ...
     $ flight        : int  1545 1714 1141 725 461 1696 507 5708 79 301 ...
     $ tailnum       : Factor w/ 3935 levels "D942DN","N0EGMQ",..: 178 518 2369 3138 2621 1129 1813 3221 2181 1164 ...
     $ origin        : Factor w/ 3 levels "EWR","JFK","LGA": 1 3 2 2 3 1 1 3 2 3 ...
     $ dest          : Factor w/ 102 levels "ABQ","ACK","ALB",..: 43 43 57 12 4 68 35 42 53 68 ...
     $ air_time      : int  227 227 160 183 116 150 158 53 140 138 ...
     $ distance      : int  1400 1416 1089 1576 762 719 1065 229 944 733 ...
     $ hour          : int  5 5 5 5 6 5 6 6 6 6 ...
     $ minute        : int  15 29 40 45 0 58 0 0 0 0 ...
     $ time_hour     : Factor w/ 4167 levels "2013-01-01 05:00:00",..: 1 1 1 1 2 1 2 2 2 2 ...



```R
summary(vols)
```


           X               year          month             day       
     Min.   :     1   Min.   :2013   Min.   : 1.000   Min.   : 1.00  
     1st Qu.: 50001   1st Qu.:2013   1st Qu.: 2.000   1st Qu.: 7.00  
     Median :100000   Median :2013   Median : 4.000   Median :15.00  
     Mean   :100000   Mean   :2013   Mean   : 6.181   Mean   :15.23  
     3rd Qu.:150000   3rd Qu.:2013   3rd Qu.:11.000   3rd Qu.:23.00  
     Max.   :200000   Max.   :2013   Max.   :12.000   Max.   :31.00  
                                                                     
        dep_time    sched_dep_time   dep_delay          arr_time    sched_arr_time
     Min.   :   1   Min.   : 500   Min.   : -43.00   Min.   :   1   Min.   :   1  
     1st Qu.: 909   1st Qu.: 905   1st Qu.:  -5.00   1st Qu.:1114   1st Qu.:1129  
     Median :1404   Median :1359   Median :  -2.00   Median :1546   Median :1603  
     Mean   :1350   Mean   :1344   Mean   :  10.75   Mean   :1515   Mean   :1543  
     3rd Qu.:1742   3rd Qu.:1729   3rd Qu.:   9.00   3rd Qu.:1944   3rd Qu.:1950  
     Max.   :2400   Max.   :2359   Max.   :1301.00   Max.   :2400   Max.   :2359  
     NA's   :4837                  NA's   :4837      NA's   :5025                 
       arr_delay           carrier          flight        tailnum       origin     
     Min.   : -86.000   UA     :34983   Min.   :   1   N725MQ :   322   EWR:72108  
     1st Qu.: -16.000   B6     :32244   1st Qu.: 541   N713MQ :   275   JFK:65630  
     Median :  -4.000   EV     :32077   Median :1485   N723MQ :   273   LGA:62262  
     Mean   :   5.794   DL     :28391   Mean   :1972   N353JB :   269              
     3rd Qu.:  13.000   AA     :19458   3rd Qu.:3494   N258JB :   258              
     Max.   :1272.000   MQ     :15725   Max.   :8500   (Other):197115              
     NA's   :5381       (Other):37122                  NA's   :  1488              
          dest           air_time        distance         hour           minute    
     ATL    : 10240   Min.   : 20.0   Min.   :  80   Min.   : 5.00   Min.   : 0.0  
     ORD    :  9760   1st Qu.: 85.0   1st Qu.: 502   1st Qu.: 9.00   1st Qu.: 6.0  
     LAX    :  9235   Median :133.0   Median : 872   Median :13.00   Median :29.0  
     BOS    :  9115   Mean   :153.1   Mean   :1031   Mean   :13.19   Mean   :25.8  
     MCO    :  8513   3rd Qu.:194.0   3rd Qu.:1389   3rd Qu.:17.00   3rd Qu.:43.0  
     CLT    :  8272   Max.   :695.0   Max.   :4983   Max.   :23.00   Max.   :59.0  
     (Other):144865   NA's   :5381                                                 
                   time_hour     
     2013-10-11 08:00:00:    92  
     2013-10-01 08:00:00:    91  
     2013-10-09 08:00:00:    91  
     2013-10-16 08:00:00:    91  
     2013-10-23 08:00:00:    91  
     2013-10-03 08:00:00:    90  
     (Other)            :199454  


Podeu fer el mateix amb la _data.frame_ _aero_, que utilitzarem més endavant.

## 2. Retard vs. Temps

Ens interessa en aquest apartat estudiar la relació (si n'hi ha) entre el retard dels vols i l'hora de sortida dels vols.

### a) Crea una nova variable _time_ dins la base de dades _vols_, que contingui l’hora i minut com un sol valor decimal (de l’estil 1.01, 1.10, 1.50 hores).

Volem crear una nova columna unint informació de la columna _hour_, que conté l'hora de sortida del vol, i la columna _minute_, que conté el minut de sortida del vol. Aquí podeu veure un extracte d'algunes columnes del nostre dataset:


```R
head(vols[c("origin", "dest", "arr_delay", "hour", "minute")], 3)
```


<table>
<thead><tr><th scope=col>origin</th><th scope=col>dest</th><th scope=col>arr_delay</th><th scope=col>hour</th><th scope=col>minute</th></tr></thead>
<tbody>
	<tr><td>EWR</td><td>IAH</td><td>11 </td><td>5  </td><td>15 </td></tr>
	<tr><td>LGA</td><td>IAH</td><td>20 </td><td>5  </td><td>29 </td></tr>
	<tr><td>JFK</td><td>MIA</td><td>33 </td><td>5  </td><td>40 </td></tr>
</tbody>
</table>



Com es veu, tenim informació de l'origen, el destí, el retard i l'hora i minut de sortida del vol, però és estrany veure l'hora de sortida en dues columnes separdes. És per això que crearem la columna següent:


```R
vols$time <- vols$hour + vols$minute / 60
```

Comprovem que la nostra nova columna s'ha afegit al final (a la dreta) de la nostra _dataframe_:


```R
head(vols, 1)
```


<table>
<thead><tr><th scope=col>X</th><th scope=col>year</th><th scope=col>month</th><th scope=col>day</th><th scope=col>dep_time</th><th scope=col>sched_dep_time</th><th scope=col>dep_delay</th><th scope=col>arr_time</th><th scope=col>sched_arr_time</th><th scope=col>arr_delay</th><th scope=col>...</th><th scope=col>flight</th><th scope=col>tailnum</th><th scope=col>origin</th><th scope=col>dest</th><th scope=col>air_time</th><th scope=col>distance</th><th scope=col>hour</th><th scope=col>minute</th><th scope=col>time_hour</th><th scope=col>time</th></tr></thead>
<tbody>
	<tr><td>1                  </td><td>2013               </td><td>1                  </td><td>1                  </td><td>517                </td><td>515                </td><td>2                  </td><td>830                </td><td>819                </td><td>11                 </td><td>...                </td><td>1545               </td><td>N14228             </td><td>EWR                </td><td>IAH                </td><td>227                </td><td>1400               </td><td>5                  </td><td>15                 </td><td>2013-01-01 05:00:00</td><td>5.25               </td></tr>
</tbody>
</table>



Bé! Hem creat una nova columna, que es diu _time_, i conté l'hora de sortida del vol en format decimal. Potser també és un format estrany, però ens ha servit per aprendre a crear una columna nova combinació d'altres columnes existents, i també ens servirà per fer un bon anàlisi.

### b) Calcula el retard mitjà i el nombre de vols per hora per a cada valor de *time* diferent. El resultat hauria de ser una dataframe anomenada *retard.per.hora* de 3 columnes, *time* , *retard* i *_n_* , amb tantes files com valors de *time* diferents existeixin. Utilitzar el paquet _dplyr_ facilita les coses!


```R
retard.per.hora <- summarise(group_by(vols, time), 
                             retard = mean(arr_delay, na.rm=TRUE), n=n())
```

Fixeu-vos en com hem afegit l'argument _na.rm=TRUE_ a la funció _mean_, que serveix per ignorar els valors _NA_.

### c) Visualitza el resultat.


```R
head(retard.per.hora)
```


<table>
<thead><tr><th scope=col>time</th><th scope=col>retard</th><th scope=col>n</th></tr></thead>
<tbody>
	<tr><td>5.000000   </td><td> -5.0049505</td><td>203        </td></tr>
	<tr><td>5.016667   </td><td>-12.0000000</td><td>  1        </td></tr>
	<tr><td>5.083333   </td><td>-21.0000000</td><td>  1        </td></tr>
	<tr><td>5.166667   </td><td> -9.7500000</td><td>  4        </td></tr>
	<tr><td>5.250000   </td><td> -8.3310345</td><td>147        </td></tr>
	<tr><td>5.283333   </td><td>  0.3043478</td><td> 24        </td></tr>
</tbody>
</table>



### d) Grafica el retard mitjà versus el temps. Escala la mida dels punts segons el nombre de vols. Quines conclusions se’n poden treure?

Per conveni graficarem la variable temporal (*time*) a l'eix de les x.


```R
ggplot(data = retard.per.hora, aes(time, retard, size = n, color = n)) +
  geom_point() + scale_size_area()
```


![png](output_32_0.png)


Ha quedat ben bonic!

Però fins i tot es pot millorar. En el gràfic hem escalat la mida dels punts segons el nombre de vols, i també hem pintat els punts segons el nombre de vols. Ens han quedat punts sobreposats, que impedeixen visualitzar bé totes les àrees del gràfic.

* Utilitzar `alpha = 0.5` permet donar transparència als punts.
* `geom_smooth(method = "lm")` afegeix una recta de regressió al gràfic.


```R
ggplot(data = retard.per.hora, aes(time, retard, size = n, color = n)) +
  geom_smooth(method = "lm") +
  geom_point(alpha = 0.5) +
  scale_size_area()
```

    `geom_smooth()` using formula 'y ~ x'



![png](output_35_1.png)


Bé, ara sí que ho donem per bo!

Sembla que es pot intuir una relació positiva entre el retard i l'hora de sortida del vol: com més tard surt el vol, més retard sembla portar.

## 3. Retard vs. destinació

Ara estem interessats en la possible relació entre el retard dels vols i la destinació d'aquests. És possible que certes destinacions acumulin vols amb més retard que d'altres? Això resoldrem en aquest apartat.

### a) De manera similar a com s’ha construit la dataframe *retard.per.hora* construirem una dataframe anomenada _retard.per.dest_. El resultat serà una dataframe amb 3 columnes, _dest_, _retard_ i _n_ que contenen, respectivament, el nom de la destinació del vol, el retard del vol i el nombre de vols que han volat a cada destinació. La dataframe tindrà tantes files com destinacions diferents hi hagi.

La pista és que ho fem _de manera similar_. Podem copiar i enganxar el codi de l'exercici anterior i modificar-lo perquè s'adapti al nou problema.


```R
retard.per.dest <- summarise(group_by(vols, dest), # alerta! agrupem per la variable "dest", aquest cop!
                             retard = mean(arr_delay, na.rm = TRUE), n = n()) # la resta és igual :)
```

### b) Visualitza _retard.per.dest_.

Fixeu-vos en com hem afegit l'argument _na.rm=TRUE_ a la funció _mean_, que serveix per ignorar els valors _NA_.


```R
head(retard.per.dest)
```


<table>
<thead><tr><th scope=col>dest</th><th scope=col>retard</th><th scope=col>n</th></tr></thead>
<tbody>
	<tr><td>ABQ       </td><td> 5,5740741</td><td>  108     </td></tr>
	<tr><td>ACK       </td><td>-0,8695652</td><td>   23     </td></tr>
	<tr><td>ALB       </td><td>20,0694444</td><td>  304     </td></tr>
	<tr><td>ATL       </td><td> 7,4182126</td><td>10240     </td></tr>
	<tr><td>AUS       </td><td> 5,7120894</td><td> 1449     </td></tr>
	<tr><td>AVL       </td><td> 9,1578947</td><td>  103     </td></tr>
</tbody>
</table>



Té bona pinta! Però volem més: resulta que hem llegit a l'inici de l'exercici un fitxer anomenat "airports.csv" a la variable _aero_, i ara és el moment de fer-la servir:


```R
head(aero, 3)
```


<table>
<thead><tr><th scope=col>X</th><th scope=col>faa</th><th scope=col>name</th><th scope=col>lat</th><th scope=col>lon</th><th scope=col>alt</th><th scope=col>tz</th><th scope=col>dst</th><th scope=col>tzone</th></tr></thead>
<tbody>
	<tr><td>1                            </td><td>04G                          </td><td>Lansdowne Airport            </td><td>41,13047                     </td><td>-80,61958                    </td><td>1044                         </td><td>-5                           </td><td>A                            </td><td>America/New_York             </td></tr>
	<tr><td>2                            </td><td>06A                          </td><td>Moton Field Municipal Airport</td><td>32,46057                     </td><td>-85,68003                    </td><td> 264                         </td><td>-6                           </td><td>A                            </td><td>America/Chicago              </td></tr>
	<tr><td>3                            </td><td>06C                          </td><td>Schaumburg Regional          </td><td>41,98934                     </td><td>-88,10124                    </td><td> 801                         </td><td>-6                           </td><td>A                            </td><td>America/Chicago              </td></tr>
</tbody>
</table>



Aquesta *data.frame* conté les latituds i longituds (les coordenades!) dels diferents aeroports d'Estats Units, i això ens pot servir per fer una bonica visualització.

### c) Uneix-li la informació d’aeroports (noms i llocs en forma de latitud i longitud). Es pot fer mitjançant la comanda *left_join* del paquet _dplyr_.  Cal tenir en compte que en una dataframe els noms dels aeroports de destinació estan a la variable _dest_ i en l'altra a la variable _faa_.

Podem utilitzar la següent construcció (en _dplyr_):

`retard.per.dest.geo <- left_join(x = retard.per.dest, y = ...,
                               by = c("dest" = "faa"))     `


```R
retard.per.dest.geo <- left_join(x = retard.per.dest,    # la taula de l'esquerra, la principal
                             y = aero,               # la taula que volem unir
                             by = c("dest" = "faa")) # les columnes per les quals volem unir
```

    Warning message:
    “Column `dest`/`faa` joining factors with different levels, coercing to character vector”

En base R (sense utilitzar funcions del paquet *dplyr*) seria:


```R
retard.per.dest.geo <- merge(x = retard.per.dest,
                         y = aero,
                         by.x = "dest", by.y = "faa",
                         all.x = TRUE, all.y = FALSE)
```

Tots els dos codis anteriors fan el mateix.

Observem com ha quedat la taula que seguidament graficarem:


```R
head(retard.per.dest.geo, 5)
```


<table>
<thead><tr><th scope=col>dest</th><th scope=col>retard</th><th scope=col>n</th><th scope=col>X</th><th scope=col>name</th><th scope=col>lat</th><th scope=col>lon</th><th scope=col>alt</th><th scope=col>tz</th><th scope=col>dst</th><th scope=col>tzone</th></tr></thead>
<tbody>
	<tr><td>ABQ                              </td><td> 5,5740741                       </td><td>  108                            </td><td> 88                              </td><td>Albuquerque International Sunport</td><td>35,04022                         </td><td>-106,60919                       </td><td>5355                             </td><td>-7                               </td><td>A                                </td><td>America/Denver                   </td></tr>
	<tr><td>ACK                              </td><td>-0,8695652                       </td><td>   23                            </td><td> 92                              </td><td>Nantucket Mem                    </td><td>41,25305                         </td><td> -70,06018                       </td><td>  48                             </td><td>-5                               </td><td>A                                </td><td>America/New_York                 </td></tr>
	<tr><td>ALB                              </td><td>20,0694444                       </td><td>  304                            </td><td>119                              </td><td>Albany Intl                      </td><td>42,74827                         </td><td> -73,80169                       </td><td> 285                             </td><td>-5                               </td><td>A                                </td><td>America/New_York                 </td></tr>
	<tr><td>ATL                              </td><td> 7,4182126                       </td><td>10240                            </td><td>154                              </td><td>Hartsfield Jackson Atlanta Intl  </td><td>33,63672                         </td><td> -84,42807                       </td><td>1026                             </td><td>-5                               </td><td>A                                </td><td>America/New_York                 </td></tr>
	<tr><td>AUS                              </td><td> 5,7120894                       </td><td> 1449                            </td><td>161                              </td><td>Austin Bergstrom Intl            </td><td>30,19453                         </td><td> -97,66989                       </td><td> 542                             </td><td>-6                               </td><td>A                                </td><td>America/Chicago                  </td></tr>
</tbody>
</table>



Vaja. Ens agradaria prou més que només contingués les columnes d'interès. Enlloc d'eliminar-les, però, el que farem serà modificar el codi perquè ja no les seleccioni:


```R
retard.per.dest.geo <- left_join(x = retard.per.dest,    # la taula de l'esquerra, la principal
                             y = aero[c("lat", "lon", "faa")],
                             # la taula que volem unir, però només les columnes d'interès i la columna d'unió
                             by = c("dest" = "faa")) # les columnes per les quals volem unir
```

    Warning message:
    “Column `dest`/`faa` joining factors with different levels, coercing to character vector”


```R
head(retard.per.dest.geo, 5)
```


<table>
<thead><tr><th scope=col>dest</th><th scope=col>retard</th><th scope=col>n</th><th scope=col>lat</th><th scope=col>lon</th></tr></thead>
<tbody>
	<tr><td>ABQ       </td><td> 5,5740741</td><td>  108     </td><td>35,04022  </td><td>-106,60919</td></tr>
	<tr><td>ACK       </td><td>-0,8695652</td><td>   23     </td><td>41,25305  </td><td> -70,06018</td></tr>
	<tr><td>ALB       </td><td>20,0694444</td><td>  304     </td><td>42,74827  </td><td> -73,80169</td></tr>
	<tr><td>ATL       </td><td> 7,4182126</td><td>10240     </td><td>33,63672  </td><td> -84,42807</td></tr>
	<tr><td>AUS       </td><td> 5,7120894</td><td> 1449     </td><td>30,19453  </td><td> -97,66989</td></tr>
</tbody>
</table>



Aquesta línia selecciona només aquelles files de la nostra _data.frame_ que no continguin cap valor *NA*.


```R
retard.per.dest.geo <- retard.per.dest.geo[complete.cases(retard.per.dest.geo), ] # Keep only the complete rows
```

Molt més net! Amb aquesta taula farem la resta de gràfics per analitzar la relació entre la destinació dels vols i el seu retard.

### d) Grafica latitud versus longitud i escala la mida dels punts segons el nombre de vols.

L'estructura bàsica d'una crida a ggplot és:

`ggplot(data = ..., aes(..., ..., size = ...)) + geom_point()`


```R
ggplot(data = retard.per.dest.geo,
       aes(lon, lat, size = n, color = retard)) +
  geom_point(alpha = 0.5)
```


![png](output_64_0.png)


La mida dels punts està graficada segons el nombre de vols a cada destinació, i el color segons el retard.

### e) Afegeix un mapa dels Estats Units sobre el gràfic. Instal·la i carrega el paquet _maps_. Afegeix "+ borders() + geom\_point()" a la crida del gràfic per mostrar el mapa del món i "+ borders(database = "state", size = 0.5) + geom\_point()" per mostrar només el mapa dels Estats Units.


```R
ggplot(data = retard.per.dest.geo,
       aes(lon, lat, size = n, color = retard)) +
  geom_point(alpha = 0.5) +
  borders(database = "state", size = 0.5)
```


![png](output_67_0.png)



```R
ggplot(data = retard.per.dest.geo,
       aes(lon, lat, size = n, color = retard)) +
  geom_point(alpha = 0.5) +
  borders()
```


![png](output_68_0.png)


Fins aquí hem utilitzat el paquet *ggplot2* per fer els gràfics. I ens ha estat ben útil! Hem pogut identificar quins aeroports acumulen més retard, i els hem pogut visualitzar al mapa.

Quan es tracta de mapes, podem utilitzar també el paquet *leaflet*, que ajuda a crear visualitzacions molt boniques.


```R
m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=retard.per.dest.geo$lon, lat=retard.per.dest.geo$lat,
             popup = paste("<strong>Destination:</strong>", retard.per.dest.geo$dest,
                           "</br><Strong>Retard:</Strong>", sprintf("%3.1f", retard.per.dest.geo$retard))
             )
m  # Print the map
```
