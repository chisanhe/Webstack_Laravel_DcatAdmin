<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="author" content="viggo">
    <title>{{ $seo->title }}</title>
    <meta name="keywords" content="{{ $seo->keywords }}">
    <meta name="description" content="{{ $seo->description }}">
    <link rel="shortcut icon" href="{{ asset('assets/img/favicon.png') }}">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Arimo:400,700,400italic">
    <link rel="stylesheet" href="{{ mix('css/app.css') }}">
    <script src="{{ mix('js/app.js') }}"></script>
    <script>
        @if (! empty($seo->baidu_tj))
        {!! $seo->baidu_tj !!}
        @endif
    </script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- / FB Open Graph -->
    <meta property="og:type" content="article">
    <meta property="og:url" content="http://www.webstack.cc/">
    <meta property="og:title" content="{{ $seo->og_title }}">
    <meta property="og:description" content="{{ $seo->description }}">
    <meta property="og:image" content="{{ '/uploads/'.$seo->banner_img }}">
    <meta property="og:site_name" content="{{ $seo->site_name }}">
    <!-- / Twitter Cards -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="{{ $seo->og_title }}">
    <meta name="twitter:description" content="{{ $seo->description }}">
    <meta property="og:image" content="{{ '/uploads/'.$seo->banner_img }}">
</head>
