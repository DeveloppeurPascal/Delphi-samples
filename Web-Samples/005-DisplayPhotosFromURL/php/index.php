<?php
	$reponse = new stdClass();
	$reponse->liste = array();
	$fichiers = scandir(__DIR__."/images/");
	foreach($fichiers as $fichier) {
		$extension = strtolower(substr($fichier,strlen($fichier)-4));
		if ((".jpg" == $extension) || (".png" == $extension)) {
			$reponse->liste[] = "http://".$_SERVER["HTTP_HOST"].$_SERVER["REQUEST_URI"]."images/".$fichier;
		}
	}
	
	print(json_encode($reponse));
	exit;
?>