module = "luaalignstate"

sourcefiles = {module .. ".dtx", "support/fancyvrbx.sty"}

unpackfiles = {module .. ".dtx"}

installfiles = {module .. ".sty", module .. ".lua"}

typesetsuppfiles = {"*.sty"}

sourcefiledir = "./."  -- trick l3build into accepting non-flat CTAN tree
flatten = false
flattentds = false
tdsroot = "luatex"
packtdszip = true

checkengines = {"luatex"}

-- make l3build compile two pdfs from one source (TODO: is this really necessary?)
local l3build_doc = doc
local l3build_jobname = jobname

function onlydoc()
    typesetfiles = {module .. ".dtx"}
    typesetcmds = "\\PassOptionsToClass{onlydoc}{l3doc}"
    typesetopts = "--interaction=nonstopmode"
    jobname = l3build_jobname
    return l3build_doc()
end

function code_jobname(name)
    return l3build_jobname(name) .. "-code"
end
function codedoc()
    typesetfiles = {module .. ".dtx"}
    typesetcmds = ""
    typesetopts = "--interaction=nonstopmode --jobname=" .. module .. "-code"
    jobname = code_jobname
    local errorlevel = l3build_doc()
    typesetfiles = {module .. "-code.dtx"}
    return errorlevel
end

function doc(targets)
    local l_typesetfiles = {}
    local errorlevel = 0
    if errorlevel == 0 and (not targets or not targets[1] or targets[1] == module) then
        errorlevel = onlydoc()
        options["rerun"] = true
        table.move(typesetfiles, 1, #typesetfiles, #l_typesetfiles+1, l_typesetfiles)
    end
    if errorlevel == 0 and (not targets or not targets[1] or targets[1] == module .. "-code") then
        errorlevel = codedoc()
        options["rerun"] = true
        table.move(typesetfiles, 1, #typesetfiles, #l_typesetfiles+1, l_typesetfiles)
    end
    typesetfiles = l_typesetfiles
    return errorlevel
end

target_list.doc.func = doc
