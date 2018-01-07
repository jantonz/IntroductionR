## Benvinguts/des a la pàgina del curs _R, visualització gràfica i Big Data_

Des d'aquí podreu seguir el curs sencer. És un bon lloc per començar a aprendre R!

Aquesta web utilitza [Markdown](https://daringfireball.net/projects/markdown/) i està penjada a [GitHub](https://github.com/jantonz/IntroductionR). Un cop completat el curs podreu proposar canvis a la web i podran ser implementats a la següent edició. En llenguatge GitHub, els vostres _commits_ podran ser _pushed_ a la _branch_ principal... ja hi arribarem!

# 1. Introducció a R
### 1.1. Primers passos en R (fora d'R)

Els primers passos els farem en [aquesta web](http://tryr.codeschool.com/). Es tracta d'una molt bona manera de fer els primers passos en diversos llenguatges de programació, per si després us animeu a aprendre Python, per exemple.

### 1.2. Instal·lació d'R i RStudio

Ara que hem jugat una mica i hem après els conceptes bàsics del llenguatge, els aplicarem dins l'espai de treball adequat. Per fero, primer ens descarregarem:
- [R](https://www.r-project.org/) i
- [RStudio](https://www.rstudio.com/)

La seva instal·lació és molt fàcil, i millor que es faci per ordre. La feina la farem en RStudio.

### 1.3. Primers passos en R (dins d'R)

És bon moment per provar algunes de les **funcions** que hem après. [Aquí](https://www.rstudio.com/wp-content/uploads/2016/05/base-r.pdf) teniu una _chuleta_ (_cheat sheet_ en anglès) amb moltes funcions per provar.

# 2. Lectura i anàlisi dades

### 2.1. Funcions bàsiques

Dins d'R hi ha diverses petites bases de dades per jugar una mica. Una de molt típica es diu _mtcars_. Podeu provar d'aplicar-hi algunes funcions.

```
str()
head()
tail()
summary()
dim()
View()
class()
```

### 2.2. Data _wrangling_

El paquet _dplyr_ és molt útil per manipular dades i es pot descarregar via `install.packages("dplyr")`. Recordeu de cridar-lo (`library(dplyr)`) abans d'utilitzar-lo.

Un _cheat sheet_ d'aquest paquet es troba [aquí](https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf).

Passarem una bona estona treballant els apartats 1, 2a-c i 3a-c d'[aquest exercici](http://bit.ly/2Cjm0y8). Es tracta d’un exercici que ens fa treballar amb dades sobre els vols que van volar des dels aeroports JFK, LGA i EWR de Nova York l’any 2013.

# 3. Representació gràfica

Per a visualitzar dades amb R, el paquet més utilitzat és _ggplot2_. El seu _cheat sheet_ es troba [aquí](https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf) i l'utilitzarem per acabar l'exercici anterior.

Es poden fer moltes correlacions, però recordeu que correlació no implica causalitat: [Spurious correlations](http://www.tylervigen.com/spurious-correlations). Aquí hi podeu trobar algunes informacions molt interessants, com que el consum de formatge per càpita es correlaciona en un 95% amb el nombre de persones mortes per per ofegament en els llençols. Alerta!

# 4. Següents passos

Check this out:
- [swirl](http://swirlstats.com/scn/)
- [manipulate](https://support.rstudio.com/hc/en-us/articles/200551906-Interactive-Plotting-with-Manipulate)
- [Shiny](https://shiny.rstudio.com/)
- [R Notebook](http://rmarkdown.rstudio.com/r_notebooks.html)
- [DataCamp](https://www.datacamp.com/)
- [Coursera](https://www.coursera.org/specializations/jhu-data-science)
