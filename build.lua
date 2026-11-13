module = "luaalignstate"

sourcefiles = {module .. ".dtx", "support/fancyvrbx.sty"}

unpackfiles = {module .. ".dtx"}

installfiles = {module .. ".sty", module .. ".lua"}

typesetcmds = "\\PassOptionsToClass{onlydoc}{l3doc}"
typesetfiles = {module .. ".dtx"}
typesetsuppfiles = {"*.sty"}

tdsroot = "luatex"
-- packtdszip = true

checkengines = {"luatex"}
