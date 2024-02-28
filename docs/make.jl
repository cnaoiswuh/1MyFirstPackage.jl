using MyFirstPackage
using Documenter

DocMeta.setdocmeta!(MyFirstPackage, :DocTestSetup, :(using MyFirstPackage); recursive=true)

makedocs(;
    modules=[MyFirstPackage],
    authors="yitaopan",
    sitename="MyFirstPackage.jl",
    format=Documenter.HTML(;
        canonical="https://yitaopan.github.io/MyFirstPackage.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/yitaopan/MyFirstPackage.jl",
    devbranch="main",
)
