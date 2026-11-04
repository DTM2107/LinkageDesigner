# Linkage sketcher

A drag-and-drop planar linkage sketcher and simulator. Draw bars, circles, rectangles and polygons, pin them together, drive a crank with a motor, trace any point, and record the motion as a video. Built around a rock-crusher jaw mechanism, with an example included.

Everything is one file (`index.html`) with no build step and no dependencies.

## Use it
- **Tools:** Select, Line, Circle, Rectangle, Polygon (icon tab).
- **Join parts:** start or end a line on an existing point.
- **Crank:** select an end point and tick Fixed, then select the line and tick Motor.
- **Trace:** select a point and tick Trace path.
- **Select several parts:** left-drag a box on empty canvas.
- **Pan / zoom:** hold the right or middle mouse button and drag / scroll.
- **Save / Open:** writes and reads a `.json` project file. **Record video** saves a `.webm`.

## Put it live on GitHub Pages
Automatic (needs the GitHub CLI, https://cli.github.com):

    ./publish.sh my-repo-name

Manual:
1. Create an empty repository on github.com (for example `linkage-sketcher`).
2. In this folder run:

        git init -b main
        git add -A
        git commit -m "Add linkage sketcher"
        git remote add origin https://github.com/YOUR-USERNAME/linkage-sketcher.git
        git push -u origin main

3. On GitHub open **Settings > Pages**, set **Source** to **GitHub Actions**.
4. The workflow in `.github/workflows/pages.yml` deploys on every push to `main`. Your page appears at `https://YOUR-USERNAME.github.io/linkage-sketcher/`.

If the first deploy fails because Pages was not enabled yet, run it again from the repository's **Actions** tab (Run workflow).   
