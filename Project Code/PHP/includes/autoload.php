<?php
/**
 * This file is used to automatically loads necessary classes and files used in the COVID Lens REST API
 */

spl_autoload_register(function($className) {
	$file = dirname(__DIR__) . '\\API\\' . $className . '.php';
	$file = str_replace('\\', DIRECTORY_SEPARATOR, $file);
	if (file_exists($file)) {
		include $file;
	}
});

spl_autoload_register(function($className) {
	$file = dirname(__DIR__) . '\\Controllers\\' . $className . '.php';
	$file = str_replace('\\', DIRECTORY_SEPARATOR, $file);
	if (file_exists($file)) {
		include $file;
	}
});

spl_autoload_register(function($className) {
	$file = dirname(__DIR__) . '\\Database\\' . $className . '.php';
	$file = str_replace('\\', DIRECTORY_SEPARATOR, $file);
	if (file_exists($file)) {
		include $file;
	}
});

spl_autoload_register(function($className) {
	$file = dirname(__DIR__) . '\\Models\\' . $className . '.php';
	$file = str_replace('\\', DIRECTORY_SEPARATOR, $file);
	if (file_exists($file)) {
		include $file;
	}
});

spl_autoload_register(function($className) {
	$file = dirname(__DIR__) . '\\Views\\' . $className . '.php';
	$file = str_replace('\\', DIRECTORY_SEPARATOR, $file);
	if (file_exists($file)) {
		include $file;
	}
});

