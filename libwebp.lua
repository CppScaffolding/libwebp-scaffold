-- scaffold geniefile for libwebp

libwebp_script = path.getabsolute(path.getdirectory(_SCRIPT))
libwebp_root = path.join(libwebp_script, "libwebp")

libwebp_includedirs = {
	path.join(libwebp_script, "config"),
	libwebp_root,
}

libwebp_libdirs = {}
libwebp_links = {}
libwebp_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { libwebp_includedirs }
	end,

	_add_defines = function()
		defines { libwebp_defines }
	end,

	_add_libdirs = function()
		libdirs { libwebp_libdirs }
	end,

	_add_external_links = function()
		links { libwebp_links }
	end,

	_add_self_links = function()
		links { "libwebp" }
	end,

	_create_projects = function()

project "libwebp"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		libwebp_includedirs,
	}

	defines {}

	files {
		path.join(libwebp_script, "config", "**.h"),
		path.join(libwebp_root, "**.h"),
		path.join(libwebp_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
