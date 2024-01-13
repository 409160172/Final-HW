using Pkg
Pkg.add("CSV")

using CSV
using DataFrames

csv_reader = CSV.File("C:/Users/USER/Documents/bank-full.csv")

df = DataFrame(csv_reader)

describe(df)

gdf = groupby(df, :job)
gdf_summary = combine(gdf, nrow)

!Pkg.add("StatsPlots")

Pkg.add("StatsPlots")

using StatsPlots
bar(gdf_summary[!, :nrow], xticks=(1:12, gdf_summary[!, :job]),labels="freq")

result = bar(gdf_summary[!, :nrow], xticks=(1:12, gdf_summary[!,:job]),labels="freq")
savefig(result, "C:\\Users\\USER\\Documents\\bank.png")

!Pkg.add("CategoricalArrays")

using CategoricalArrays

using Statistics

balance_edge = -10000:500:1000000
df.balance_bin = cut(df[!,:balance], balance_edge)
combine(groupby(df, :balance_bin), nrow)

!Pkg.add("Plots")

using Plots

b_range = range(-1000, 1000, length=20)
histogram(df[!,:balance],bins=b_range)
histogram(df[!,:balance],bins=b_range, normalize=:pdf,labels="probability")
xlims!(-1000, 1000)

!Pkg.add("StatsPlots")

using StatsPlots

scatter(df[!,:balance], df[!,:duration])


