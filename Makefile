all:index.html

data_files = 
data_rda = $(addprefix data/, $(addsuffix .rda, $(data_files)))

index.html:index.Rmd ./css/revealOpts.css $(data_rda)
	Rscript -e "rmarkdown::render('$<')"

data/%.rda:%.R
	Rscript -e "source('$<')"

clean:
	rm -rf data/*.rda
	rm index.html
