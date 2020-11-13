<!doctype html>
<html>
<head>
  <meta charset="utf-8"/>
  <title>criterion report</title>
  <script>
    {{{js-chart}}}
    {{{js-criterion}}}
  </script>
  <style>
    {{{criterion-css}}}
  </style>
  <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
  <div class="content">
    <h1 class='title'>criterion performance measurements</h1>
    <p class="no-print"><a href="#grokularation">want to understand this report?</a></p>
    <h1 id="overview"><a href="#overview">overview</a></h1>
    <div class="no-print">
      <select id="sort-overview" class="select">
        <option value="report-index">index</option>
        <option value="lex">lexical</option>
        <option value="colex">colexical</option>
        <option value="duration">increasing time</option>
        <option value="rev-duration">decreasing time</option>
      </select>
      <span id="explain-interactivity">
        click bar/label to zoom. click x-axis for logarithmic scale.
      </span>
    </div>
    <aside id="overview-chart"></aside>
    <main id="reports"></main>

    <div id="report-data" data-report-json='{{{json}}}'></div>
  </div>

  <aside id="grokularation" class="grokularation">

    <h1><a>understanding this report</a></h1>

    <p>
      In this report, each function benchmarked by criterion is assigned a section of its own.
      <span class="no-print">The charts in each section are active; if you hover your mouse over data points and annotations, you will see more details.</span>

      The first chart on this page provides an overview of the estimated mean execution time for each benchmark.
      The colors of the bars are given by the benchmark groups.

      <span class="no-print">
      If you click the x-axis in the overview chart the scale toggles between a linear scale and a logatithmic one.
      </span>
    </p>

    <ul>
      <li>
        The chart on the left is a <a href="http://en.wikipedia.org/wiki/Kernel_density_estimation">kernel density estimate</a> (also known as a KDE) of time measurements.
        This graphs the probability of any given time measurement occurring.
        A spike indicates that a measurement of a particular time occurred; its height indicates how often that measurement was repeated.
      </li>

      <li>
        The chart on the right is the raw data from which the kernel density estimate is built.
        The <em>x</em> axis indicates the number of loop iterations, while the <em>y</em> axis shows measured execution time for the given number of loop iterations.
        The line behind the values is the linear regression prediction of execution time for a given number of iterations.
        Ideally, all measurements will be on (or very near) this line.
      </li>
    </ul>

    <p>
      Under the charts is a small table.
      The first two rows are the results of a linear regression run on the measurements displayed in the right-hand chart.
    </p>

    <ul>
      <li>
        <em>OLS regression</em> indicates the time estimated for a single loop iteration using an ordinary least-squares regression model.
        This number is more accurate than the <em>mean</em> estimate below it, as it more effectively eliminates measurement overhead and other constant factors.
      </li>
      <li>
        <em>R<sup>2</sup>; goodness-of-fit</em> is a measure of how accurately the linear regression model fits the observed measurements.
        If the measurements are not too noisy, R<sup>2</sup>; should lie between 0.99 and 1, indicating an excellent fit.
        If the number is below 0.99, something is confounding the accuracy of the linear model.
      </li>
      <li>
        <em>Mean execution time</em> and <em>standard deviation</em> are statistics calculated from execution time divided by number of iterations.
      </li>
    </ul>

    <p>
      We use a statistical technique called the <a href="http://en.wikipedia.org/wiki/Bootstrapping_(statistics)">bootstrap</a> to provide confidence intervals on our estimates.
      The bootstrap-derived upper and lower bounds on estimates let you see how accurate we believe those estimates to be.
      <span class="no-print">(Hover the mouse over the table headers to see the confidence levels.)</span>
    </p>

    <p>
      A noisy benchmarking environment can cause some or many measurements to fall far from the mean.
      These outlying measurements can have a significant inflationary effect on the estimate of the standard deviation.
      We calculate and display an estimate of the extent to which the standard deviation has been inflated by outliers.
    </p>

  </aside>


  <footer>
    <div class="content">
      <h1 class="colophon-header">colophon</h1>
      <p>
        This report was created using the <a href="http://hackage.haskell.org/package/criterion">criterion</a>
        benchmark execution and performance analysis tool.
      </p>
      <p>
        Criterion is developed and maintained
        by <a href="http://www.serpentine.com/blog/">Bryan O'Sullivan</a>.
      </p>
    </div>
  </footer>
</body>
</html>
