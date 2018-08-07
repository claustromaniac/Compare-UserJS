Compare-UserJS
==============

No idea what *user.js* is? Read [this article](https://developer.mozilla.org/en-US/docs/Mozilla/Preferences/A_brief_guide_to_Mozilla_preferences).<br> *Note: For enhanced privacy and security I use (and recommend) the [ghacks-user.js](https://github.com/ghacksuserjs/ghacks-user.js).*

This script requires only [PowerShell](https://github.com/PowerShell/PowerShell) v2+, which comes pre-installed on Windows 7, but it *should* also run fine on Unix-like systems.

Compare-UserJS uses my own elegant <sup>[<i>Citation needed.</i>]</sup>  algorithm for parsing JavaScript half-assedly, and by default logs the results to *userJS_diff.log*.

Things detected (and reported) by this script:

- matching prefs, both value and state (active/inactive)
- prefs with different values but matching state
- prefs declared in file A but not in file B
- declared in file B but not in file A
- inactive (declared within JS comments) in A but active in B
- inactive in B but active in A
- duplicates in each of the two source files.

Additionally, it can catch one type of syntax error (for now), and includes that information in the report.
<br><br>


Usage
------

Simply save this script wherever you want, launch the PowerShell CLI, [CD to the path of the script](https://ss64.com/ps/set-location.html), and run it, as in:

```PowerShell
CD C:\path\to\the\script
.\Compare-UserJS
```

If you're a PowerShell virgin and you still don't have a clue what I am talking about, don't freak out (been there, done that) and just keep reading. There is an alternative below. If you're the reader type, [read this](https://ss64.com/ps/syntax-run.html) (or just search teh interwebz).

The script will prompt you to enter the paths of the two user.js files to compare. Keep in mind that the actual names of the files don't matter, I only refer to them as *user.js* because that's what their names have to be when... OMG am I really explaining this?

See the embedded help info with:

```PowerShell
Get-Help .\Compare-UserJS -full
```

Or just read it from the file, but that's less thrilling.

If you don't want to type that much (and you're on Windows), you can alternatively run the batch script *Compare-UserJS.bat* from the same folder as the PS script. It works as a launcher that bypasses the PS execution policy. Saves you opening the CLI, CD'ing and typing in the command, but Compare-UserJS will still have you type in the paths of the two *user.js* files unless you drag-and-drop them on the BAT directly. Compare-UserJS will still NOT make you coffee, though.

You can see an example of what the output looks like [here](userJS_diff.log).
<br><br>


Parameters
-----------

|**Index** |   **Name**    | **Required?** |    **Default**    |                        **Description**                        |
|:--------:|:-------------:|:-------------:|:-----------------:|---------------------------------------------------------------|
|    0     | `filePath_A`  |      Yes      |                   | Path to the first file to compare. (1)                        |
|    1     | `filePath_B`  |      Yes      |                   | Path to the second file to compare.                           |
|    2     |  `ouputFile`  |      No       | *userJS_diff.log* | Path to the file where the report will be dumped.             |
|    3     |   `append`    |      No       |       false       | Append the report to the end of the file if it already exists.|
|    4     | `noCommentsA` |      No       |       false       | Parse JS comments in file A as code. (2)                      |
|    5     | `noCommentsB` |      No       |       false       | Parse JS comments in file B as code.                          |
|    6     |  `hideMask`   |      No       |         0         | Bitmask value for hiding parts of the report selectively. (3) |
|    7     |    `inJS`     |      No       |       false       | Get the report written in JavaScript. (4)                     |

**1:** All path parameters can be absolute or relative. 
**2:** Mostly deprecated. It should make parsing slightly faster with files that you know beforehand that don't have comments. 
**3:** See the embedded help info for details. 
**4:** It will be written to *userJS_diff.js* unless the `-outputFile` parameter is also specified.
<br><br>


F.A.Q. <sup><sup><sub>(assuming it counts when I'm the one asking)<sub></sup></sup>
-------

*Q: Why the heck did you make this?*
A: Firstly, to prove myself that I can produce nearly-awe-inducing garbage in under ~~200~~ 500 lines of code (I wish). Secondly, I have some shit to compare. Thirdly, I'm hooked on regular expressions.
<br><br>


Acknowledgements
-----------------
[Thorin-Oakenpants](https://github.com/Thorin-Oakenpants) and [earthlng](https://github.com/earthlng) for their valuable feedback on the initial stages of this little project.
