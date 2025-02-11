<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Power of Memory</title>
    <link rel="shortcut icon" href="#">
    <meta name="description" content="">
    <?php
        require_once __DIR__ .'/../utils/common.php';
        if (isset($css_file)) {
            echo '<link rel="stylesheet" href="/assets/css/' . $css_file . '">';
        }
        if (isset($header_css)) {
            echo '<link rel="stylesheet" href="' . $header_css . '">';
        }
        if (isset($js_file)) {
            echo '<script src="/assets/js/' . $js_file . '"></script>';
        }
    ?>
</head>
