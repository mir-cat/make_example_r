# Dummy targets
all: all_data output plots make_graph.png
all_data: raw_data data

raw_data: raw_data/raw_iris.csv	raw_data/raw_mtcars.csv
data: data/edit_iris.csv data/edit_mtcars.csv

output: output/iris_models/
plots: plots/plots.pdf

make_graph: make_graph.png

clean:
	rm -rf output/
	rm -rf plots/
	rm -rf raw_data/
	rm -rf data/
	rm -f make_graph.png

.PHONY: all clean data raw_data all_data output plots

## raw_data            : import iris and mtcars dataset
raw_data/%.csv: scripts/import_%.R
	Rscript $<

## data                : lightly edit datafiles
data/edit_%.csv: scripts/edit_%.R raw_data/raw_%.csv
	Rscript $<

## all_data            : raw_data and data

## output              : random iris models
output/iris_models/: scripts/model.R data/edit_iris.csv
	Rscript $<

## plots               : two mtcars and one iris plot
plots/plots.pdf: scripts/plot.R data
	Rscript $<

make_graph.png: Makefile
	make -Bnd | make2graph | dot -Tpng -o make_graph.png

.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<
