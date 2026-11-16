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

    The auxiliary file `support/fancyvrbx.sty` must be either in the TeX search path, or in a subdirectory of the current directory named `support/` (it is not needed to use the package, only to typeset the documentation).

-   Only typeset the interface documentation:

    ```bash
    pdflatex '\PassOptionsToClass{onlydoc}{l3doc}\input' luaalignstate.dtx
    ```

-   `l3build doc` in the development repository will typeset both versions of the documentation.

*Note:* the file `support/fancyvrbx.sty` is a collection of ad-hoc macros used by the documentation.
It is not meant to be installed or broadly usable.

## License and repository

-   License: MIT
-   Repository: https://github.com/rynchn/luaalignstate
