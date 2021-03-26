using Pkg: Pkg, Registry, TOML

ENV["PYTHON"] = Sys.which("python")
Pkg.instantiate()
Registry.rm("General")
python_deps = collect(TOML.parsefile("Project.toml")["python"])
foreach(dep -> run(`pip install $(dep.first)==$(dep.second)`), python_deps)