# Crumble: history and modern reconstruction

This folder contains a newly written, standalone reconstruction of the historical **Crumble** screen effect. It is not recovered original source code.

**Live demo:** <https://owhall.github.io/crumble/>

## Run it

No installation or build is required.

- **Windows:** double-click `run-crumble.bat`, or double-click `index.html`.
- **Linux:** run `sh run-crumble.sh`, or open `index.html` in a modern browser. You may instead make the launcher executable with `chmod +x run-crumble.sh` and then use `./run-crumble.sh`.
- Any platform: drag `index.html` into Firefox, Chrome, Edge, or another current browser.

The program runs locally and makes no network requests. For the most period-like view, choose **Fullscreen**. Use Space to pause, R to reset, F for fullscreen, and H to hide the controls.

## What the evidence supports

### Strong historical evidence

The clearest period account is Peter Eldin's *The Official Handbook of Practical Jokes* (first printing, March 1989), pages 88–89. It calls the program **Crumble**, attributes it to “a talented and imaginative Yale student,” and says it ran on a bitmapped graphics system. It describes minute fragments breaking from letters, drifting down, and collecting in dust piles while the program remained in the background. Crucially, it says Crumble and the related Worms program were implemented on the **Yale GEM system several years before the IBM PC**.

The Yale Department of Computer Science's own report catalog independently documents GEM. Its entries include *An Overview of the YALE GEM System* (TR018, 1973) and John Levine's *An Overview of the Yale GEM System* (TR163, 1979). The latter describes GEM as a shared, graphics-oriented facility whose terminal screens were bit arrays 576 pixels wide by 454 pixels high.

Together, these sources strongly support a Yale/GEM origin in the 1970s or very early 1980s. The 1989 book is a secondary account, however: it does not name the programmer, give a date, print source code, or explain its own sourcing.

### SunOS connection: plausible, not established

Sun's May 1988 *Pixrect Reference Manual* confirms that ordinary programs could manipulate rectangular pixel arrays on Sun workstation screens. Sun's January 1990 SunOS 4.1 manual identifies `/dev/fb` as the default framebuffer device. These interfaces made a Crumble-like implementation entirely feasible on late-1980s Sun hardware.

A 2023 Hacker News reminiscence recalls screen-melting effects in the SunOS era and separately recalls programs named **Crumble** and **Melt** on Apollo Domain workstations. That is useful evidence that similarly named/effected programs circulated, but it is a late recollection—not proof of a specific SunOS port or shared source lineage.

### What was not found

The research did **not** locate any of the following:

- original Yale GEM Crumble source or binary;
- an author name or exact creation date;
- a period SunOS/SunView program named `crumble` with verifiable source;
- evidence that the Yale version was ported to SunOS;
- evidence that later Apollo, Sun, or PC versions used the Yale code.

Accordingly, it would be inaccurate to call the effect originally a “late-1980s Unix/SunOS program.” The best-supported statement is: **Crumble originated on Yale's pre-Unix-workstation-era GEM bitmap system; Crumble-like effects later existed in workstation environments, but the SunOS provenance remains unverified.**

## Sources

1. Peter Eldin, *The Official Handbook of Practical Jokes* (NAL/Penguin, first printing March 1989), pp. 88–89. Internet Archive scan referenced by the searchable copy: <https://archive.org/details/officialhandbook00pete>
2. Yale Engineering, Computer Science Technical Reports catalog (TR018 and TR163): <https://engineering.yale.edu/academic-study/departments/computer-science/technical-reports>
3. John Levine, “An Overview of the Yale Gem System,” *Software: Practice and Experience* 12 (1982), 1131–1142, DOI: <https://doi.org/10.1002/spe.4380121205>
4. Sun Microsystems, *Pixrect Reference Manual*, Revision A, 9 May 1988: <https://bitsavers.org/pdf/sun/sunos/4.0/800-1785-10A_Pixrect_Reference_Manual_198805.pdf>
5. Sun Microsystems, *SunOS 4.1 Pixrect Reference Manual*, Revision A, 5 January 1990: <https://bitsavers.org/pdf/sun/sunos/4.1/800-4835-10A_4.1_Pixrect_Reference_Manual_199001.pdf>
6. Hacker News discussion (2023), later recollections only: <https://news.ycombinator.com/item?id=36857314>

## Reconstruction design

`index.html` is an original clean-room behavioral reconstruction written in HTML, CSS, and JavaScript. The legacy `crumble.html` address redirects to it. The reconstruction:

- renders black monospace text on a white 720×450 logical bitmap;
- presents a clean one-bit text image for three seconds before decay begins;
- releases individual edge pixels from glyphs;
- applies gravity to each released pixel;
- lets pixels slide and accumulate into dust piles;
- uses a fixed pseudorandom seed so Reset repeats the same decay;
- stays inside its own canvas and never reads or modifies the actual screen.

The resolution, sample SunOS-like text, timing, erosion rules, and physics are artistic/engineering choices. They are not claims about the missing original implementation. The logical size is deliberately close to Yale GEM's documented 576×454 display without pretending to reproduce its hardware exactly.

## License

The reconstruction code in this folder is released under the MIT License. Historical names and quoted descriptions remain the property of their respective owners.
