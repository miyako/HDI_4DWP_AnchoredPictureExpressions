# HDI_4DWP_AnchoredPictureExpressions

![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)
![license](https://img.shields.io/github/license/miyako/HDI_4DWP_AnchoredPictureExpressions)

**How do I** set an expression on anchored pictures in a 4D Write Pro document?

A "How Do I" (HDI) example for 4D Write Pro: anchored images whose content is driven by an expression (a variable, a picture field, or a project method) and refreshed on demand.

## Features

- Insert an anchored picture and bind it to an expression with the `wk image expression` attribute
- Three expression types:
  - a **variable** (`vPicture`), anchored top-left
  - a **picture field** (`[DOC]SamplePict`), anchored top-centre
  - a **project method** returning a picture (`TimestampPicture`), anchored top-right
- Refresh with `ST COMPUTE EXPRESSIONS`; detach with `WP RESET ATTRIBUTES`; recompute then detach with `ST FREEZE EXPRESSIONS`
- Table forms (`Input`, `Output`) showing a Write Pro field with the palette widget

## Requirements

- 4D 21 or later (project compatibility version 21.1)
- A valid **4D Write Pro** licence (the splash form checks it and stays on "Close" if missing)
- The splash declares a minimum of 4D 17 R2, the release that introduced the feature

## Usage

1. Open `Project/HDI_4DWP_AnchoredPictureExpressions.4DProject` with 4D.
2. Run the **Demo** menu item (`00_Start`), also executed on startup.
3. On the **Add picture** tab add anchored pictures; on **Set attribute** tab apply, compute, reset or freeze expressions.
4. Tick **Trace** to step through the code in the debugger.

## Points of interest

- `Methods/TimestampPicture.4dm`: expression method (builds an SVG and returns a PNG); it must be allowed first:
  ```4d
  ARRAY TEXT($methods; 0)
  APPEND TO ARRAY($methods; "TimestampPicture")
  SET ALLOWED METHODS($methods)
  ```
- `Forms/HDI2/ObjectMethods/Button*.4dm`: the `WP Add picture` / `WP SET ATTRIBUTES` / `wk image expression` calls, one per expression type
- `Methods/00_Start.4dm`: splash launched through `CALL WORKER` with non-blocking `DIALOG(...; *)`, reusing an already open window
- `Forms/HDI/`: reusable splash form that checks the minimum 4D version and licence

## Project structure

| Path | Content |
|------|---------|
| `Project/Sources/Methods` | startup and helper methods, compiler declarations |
| `Project/Sources/Forms` | `HDI` (splash), `HDI2` (demo) |
| `Project/Sources/TableForms` | `[DOC]` input and output forms |
| `Project/Sources/styleSheets*.css` | dark mode, Liquid Glass button heights, platform fonts |
| `Resources/{en,ja}.lproj` | XLIFF localisation |

## Modernisation notes

Converted from a 4D v18 binary database to a project with 4D 21, then updated:

- `var` / `#DECLARE` instead of `C_*` declarations
- XLIFF localisation (English, Japanese) for menus, forms, tips and messages
- Dark mode via `automatic` colours and `prefers-color-scheme` CSS; Liquid Glass button sizing via `form-theme`
- Standard menu actions; subroutines hidden from the Run Method dialog
- No list boxes in this project, so list box display defaults do not apply

## References

- Blog: <https://blog.4d.com/flash-news-4d-write-pro-and-anchored-images/>
- Original download: <https://download.4d.com/Demos/4D_v17_R2/HDI_4DWP_AnchoredPictureExpressions.zip>
- 4D Write Pro: <https://developer.4d.com/docs/WritePro/overview>
- CSS in 4D: <https://developer.4d.com/docs/FormEditor/stylesheets>

## License

[MIT](LICENSE)
