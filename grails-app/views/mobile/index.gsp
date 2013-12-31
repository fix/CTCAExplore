<!doctype html>
<html manifest="${createLink(action:'manifest')}">

<head>
    <meta charset="utf-8">
    <title>CTCAE v4.0</title>
    <meta name="description" content="">
    <meta name="HandheldFriendly" content="True">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="cleartype" content="on">

    <!-- iPhone -->
    <link href="http://cdn.tapquo.com/lungo/icon-57.png" sizes="57x57" rel="apple-touch-icon">
    <link href="http://cdn.tapquo.com/lungo/startup-image-320x460.png" media="(device-width: 320px) and (device-height: 480px)
             and (-webkit-device-pixel-ratio: 1)" rel="apple-touch-startup-image">

    <!-- iPhone (Retina) -->
    <link href="http://ventura-associate.com/images/logo_ventura-associates.png" sizes="114x114" rel="apple-touch-icon">
    <link href="http://ventura-associate.com/images/logo_ventura-associates.png" media="(device-width: 320px) and (device-height: 480px)
             and (-webkit-device-pixel-ratio: 2)" rel="apple-touch-startup-image">

    <!-- iPhone 5 -->
    <link href="http://cdn.tapquo.com/lungo/startup-image-640x1096.png" media="(device-width: 320px) and (device-height: 568px)
             and (-webkit-device-pixel-ratio: 2)" rel="apple-touch-startup-image">

    <!-- iPad -->
    <link href="http://cdn.tapquo.com/lungo/icon-72.png" sizes="72x72" rel="apple-touch-icon">
    <link href="http://cdn.tapquo.com/lungo/startup-image-768x1004.png" media="(device-width: 768px) and (device-height: 1024px)
             and (orientation: portrait)
             and (-webkit-device-pixel-ratio: 1)" rel="apple-touch-startup-image">
    <link href="http://cdn.tapquo.com/lungo/startup-image-748x1024.png" media="(device-width: 768px) and (device-height: 1024px)
             and (orientation: landscape)
             and (-webkit-device-pixel-ratio: 1)" rel="apple-touch-startup-image">

    <!-- iPad (Retina) -->
    <link href="http://cdn.tapquo.com/lungo/icon-144.png" sizes="144x144" rel="apple-touch-icon">
    <link href="http://cdn.tapquo.com/lungo/startup-image-1536x2008.png" media="(device-width: 768px) and (device-height: 1024px)
             and (orientation: portrait)
             and (-webkit-device-pixel-ratio: 2)" rel="apple-touch-startup-image">
    <link href="http://cdn.tapquo.com/lungo/startup-image-1496x2048.png" media="(device-width: 768px) and (device-height: 1024px)
             and (orientation: landscape)
             and (-webkit-device-pixel-ratio: 2)" rel="apple-touch-startup-image">
	 
	 <r:require module="lungo"/>
	  
	 <r:layoutResources/>
	 
	 <style type="text/css">
	 	section.pullsearch > [data-control="pull"]{
	 		top:0px;
	 	}
	 </style>
	 
</head>

<script id="resultItems" type="text/html">
{{#results}}
<li data-view-article='ae' data-id='{{ae.id}}' class='result arrow'>
	{{name}}
</li>
{{/results}}
</script>

<script id="aeItems" type="text/html">
{{#aes}}
<li data-view-article='ae' data-id='{{id}}' class='result arrow'>
	{{preferedName}}
</li>
{{/aes}}
</script>

<script id="aeItem" type="text/html">
<ul>
	<li>
		<strong class="text bold">{{preferedName}}</strong>
	</li>
	<li>
		<strong class="text bold">Definition</strong>
		<span class="text">{{definition}}</span>
	</li>
	{{#grades}}
		<li>
			<strong class="text bold">Grade {{level}}</strong>
			<span class="text">{{definition}}</span>
		</li>
	{{/grades}}
	<li class="chevron">
		<strong class="text bold">Category</strong>
		<span class="text">{{category.name}}</span>
	</li>
	<li>
		<span class="on-right" data-count="{{numberOfSynonyms}}"></span>
		<strong class="text bold">Synonyms</strong>
		<span class="text">{{#synonyms}}{{name}} | {{/synonyms}}</span>
	</li>
</ul>
</script>

<script id="categoryItems" type="text/html">
{{#categories}}
<li data-view-article='categoryaes' data-id='{{id}}' class='categories arrow'>
	<strong class="text bold">{{name}}</strong>
</li>
{{/categories}}
</script>

<body>
	<section id="main" data-pull="normal" data-transition="slide" data-aside="aside" class="pullsearch drag">
        
        <article id="home" class="form splash active">
        	<h1>Common Terminology Criteria for Adverse Events (CTCAE)</h1>
            <br>
            <div>
	            <div id="cache-loading" data-progress="100%"></div>
	            <button class="large" data-view-article="search" data-icon="search"> Search</button>
	            <button class="category large" data-view-article="categories" data-icon="list"> Explore</button>
	            <button class="large investigations" data-view-article="investigations" data-icon="tint"> Investigations</button>
	            <button class="large" data-view-section="about" data-icon="question-sign"> About</button>
            </div>
        </article>
        
        <article id="categories" class="list scroll"></article>
        
        <article id="categoryaes" class="list scroll"></article>
        
        <article id="investigations" class="list scroll"></article>
        
        <article id="ae" class="list scroll"></article>

    	<article id="search" class="scroll">
			<div class="form">
				<fieldset data-icon="search">
			    	<input id="term" name="term" type="search" placeholder="Search term"/>
			    </fieldset>
			    <button class="dark" id="togglesearch">Search</button>
			</div>
			<ul id="results" class="list"></ul>
		</article>
    
    </section>
   
	<section id="about" data-transition="slide" >
	
       <article id="about" class="splash" >
			This is brought to you by 
			<br><br><br><br>
			<a href="http://ventura-associate.com/" target="_blank"><img alt="Ventura Associates" src="${resource(dir: 'images', file: 'logo_venturacare.png')}"></a>
			<br><br><br><br>
			<div>
               <button class="large" data-view-section="main" data-icon="home"> Home</button>
            </div>
	   </article>
	
	</section>
	
	<aside id="aside" data-transition="left">
	    
	    <article class="list active">
	        <ul>
	            <li>
	                <img src="${resource(dir: 'images', file: 'logo_venturacare_small.png')}" class="title centered">
	            </li>
	            
	            <li id="offline" class="hide">
	                <a class="button cancel offlinebutton">OFFLINE</a>
	            </li>
	            
	            <li id="updatebutton" class="hide">
	                <a class="button accept">UPDATING...</a>
	            </li>
	            
	            <li data-view-article="home" data-icon="home">
	                <strong>CTCAE v4</strong>
	                <small>home</small>
	            </li>
	
	            <li data-view-article="search" data-icon="search">
	                <strong>Search</strong>
	            </li>
	
	            <li data-view-article="categories" class="category" data-icon="list">
	                <strong>Explore</strong>
	                <small>by category</small>
	            </li>
	            
	            <li data-view-article="investigations" class="investigations" data-icon="tint">
	                <strong>Investigations</strong>
	                <small>laboratory results</small>
	            </li>
	        </ul>
	    </article>
	
	</aside>
	
	<g:javascript>
	
	currentsearch=""
	
	Lungo.ready(function() {
		Lungo.dom("#updatebutton").hide();
		Lungo.dom("#offline").hide();
		Lungo.dom('.offlinebutton').tap(function(e) {checkOffline();});
		checkOffline();
		
		Lungo.Service.get('${createLink(controller:"category", action:"get")}', {id : 13}, parseInvestigations, "json");
		Lungo.Service.get('${createLink(controller:"category", action:"get")}', {id : 0}, parseCategories, "json");
		
		applicationCache.addEventListener('updateready', handleAppCache, false);
	});
	
	var checkOffline = function(onlineCallback, offlineCallback) {
		Lungo.Service.get('${createLink(controller:"mobile", action:"online")}',{}, evalOffline(onlineCallback, offlineCallback), "text");
	};
	
	Lungo.dom('#togglesearch').tap(function(event) {
		var data = {search : Lungo.dom("#term").val()};
	
		var onlineCallback = function() {
			Lungo.Service.cache('${createLink(controller:"adverseEvent", action:"ajaxsearch")}',data, '2 hours', parseResults, "json");
		};
	
		var offlineCallback = function() {
			if(currentsearch!=data.search){
				currentsearch=data.search;
				Lungo.Service.get('${createLink(controller:"mobile", action:"synonyms")}', {}, parseSynonyms(data.search.toLowerCase()), "json");
				var pullsearch = new Lungo.Element.Pull('#search', {
					onPull : "Trying to reconnect", //Text on pulling
					onRelease : "Reconnecting",//Text on releasing
					onRefresh : "OK", //Text on refreshing
					callback : function() { //Action on refresh
						checkOffline(onlineCallback, offlineCallback);
						pullsearch.hide();
					}
				});
			}
		};
		
		checkOffline(onlineCallback, offlineCallback);
	
		return false;
	});
	
	var parseSynonyms = function(searchdata) {
		return function(results){
			var synonyms=[];
			
			for(var i=0; i < results.length && synonyms.length < 30 ; i++){
				if(results[i].name.toLowerCase().search(searchdata) > -1){
					synonyms.push({name:results[i].name, ae:{id:results[i].aeid}});
				}
			}
			Lungo.dom("#results").empty();
			Lungo.dom("#results").append("<li>OFFLINE! try to reconnect and pull to refresh</li>");
			Lungo.dom("#results").append(Mustache.render(ritems, {results : synonyms}));
			Lungo.dom('.result').tap(function(e) {
				var data = {id : Lungo.dom(this).data("id")};
				Lungo.Service.get('${createLink(controller:"adverseEvent", action:"get")}',data, parseAE, "json");
			});
		}
	};

	var parseResults = function(results) {
		Lungo.dom("#results").empty();
		Lungo.dom("#results").append(Mustache.render(ritems, {results : results}));
		Lungo.dom('.result').tap(function(e) {
			var data = {id : Lungo.dom(this).data("id")};
			Lungo.Service.get('${createLink(controller:"adverseEvent", action:"get")}',data, parseAE, "json");
		});
	};
	
	var parseCategories = function(results) {
		Lungo.dom("#categories").empty();
		Lungo.dom("#categories").append(Mustache.render(caitems, {
			categories : results
		}));
		Lungo.dom('.categories').tap(function(e) {
			var data = {id : Lungo.dom(this).data("id")};
			Lungo.Service.get('${createLink(controller:"category", action:"get")}',data, parseCategory, "json");
		});
	};
	
	var parseInvestigations = function(inv) {
		Lungo.dom("#investigations").empty();
		Lungo.dom("#investigations").append(Mustache.render(aeitems, {aes : inv.adverseEvents}));
		Lungo.dom('.result').tap(function(e) {
			var data = {id : Lungo.dom(this).data("id")};
			Lungo.Service.get('${createLink(controller:"adverseEvent", action:"get")}',data, parseAE, "json");
		});
	};
	
	var parseCategory = function(aes) {
		Lungo.dom("#categoryaes").empty();
		Lungo.dom("#categoryaes").append(Mustache.render(aeitems, {aes : aes.adverseEvents}));
		Lungo.dom('.result').tap(function(e) {
			var data = {id : Lungo.dom(this).data("id")};
			Lungo.Service.get('${createLink(controller:"adverseEvent", action:"get")}',data, parseAE, "json");
		});
	};
	</g:javascript>
	
	<r:layoutResources/>
	
</body>
</html>