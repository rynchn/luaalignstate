# luaalignstate

This is a Lua(La)TeX package that provides a hack to access the alignment brace counter (aka "master counter", `align_state`).

Intended only for low-level programming and debugging; not for ordinary documents.

## Building

-   Extract the Lua and LaTeX packages:

    ```bash
    tex luaalignstate.dtx
    ```

-   Extract the Lua and LaTeX packages and also typeset the documented code:

    ```bash
    pdflatex luaalignstate.dtx
    ```

    The support file `fancyvrbx.sty` must be in the TeX search path (it is not needed to use the package, only to typeset the documentation).

-   Only typeset the interface documentation:

    ```bash
    pdflatex '\PassOptionsToClass{onlydoc}{l3doc}\input' luaalignstate.dtx
    ```

    Alternatively, `l3build doc` in the source repository will do the same.

*Note:* the file `fancyvrbx.sty` is an ad-hoc auxiliary needed when compiling the documentation.
It is not meant to be installed or broadly usable.

## License and repository

-   License: MIT
-   Repository: https://github.com/rynchn/luaalignstate
