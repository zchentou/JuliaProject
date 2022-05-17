using PkgTemplates

t = Template(;
    user="zchentou",
    dir="./",
    authors="zchentou",
    plugins=[
        Git(; manifest=true, ssh=true),
    ],
)

t("Euchre")