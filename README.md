# Changelog
This repository is my personal tweaking of the original project, which itself was edited by HalfBakedCake to work with newer HD versions. Thanks to everyone who worked on it before to create a highly useful and fun mod.
Creating new weapons consists of creating a new zs under /source/examples/weapons/. Textures are edited under /graphics/gunimages/ and /sprites. Make sure to change textures under /textures.xxx and load by editing /zscript.
New sprites have to have offsets set through something like SLADE. 

**Now requires Accensi's 'HDBulletLib (https://gitlab.com/accensi/hd-addons/hdbulletlib), due to dependency on new calibers**

**If you just want to get the weapon ids for loadouts, check out the `id.md` file. Also make sure to scroll down to read the original project README.** 

- Reworked M4 to M4A1
	- Firemodes: Semi/Auto
	- Reduced Recoil
	- Same loadout code

- Reworked M249
	- Reduced recoil
	- Same loadout code

- Reworked Glock to Glock 18
	- Firemodes: Semi/Auto 
	- Capacity changed to 17 rounds
	- Magazine changed to hold 17 rounds
	- Same loadout codes for magazine and gun

- Reworked AKM to AK-15
    - Part of the fifth generation of Kalashnikov rifles (AK-12, AK-15, AK-19, AK-308). Designed for Russian military.
	- Added "NATO" rails to attach attachments such as optics  
	- Slightly reduced recoil
	- Same loadout code as AKM

- Added AK-12 (w17)
    - Part of the fifth generation of Kalashnikov rifles (AK-12, AK-15, AK-19, AK-308). Designed for Russian military.
	- The 5.45 version of the old AKM.  Shares 5.45 mags with the AK74
	- Reduced recoil compared to the AK-15
	- Has "NATO" rails to attach attachments such as optics 
	- Firemodes: Semi/Auto
	- Loadout code is w17

- Added AK-19 (w14)
    - Part of the fifth generation of Kalashnikov rifles (AK-12, AK-15, AK-19, AK-308). Designed for international export.
	- The 5.56 version of the old AKM.  Shares 5.56 mags with the M4A1
	- Reduced recoil compared to the AK-15 and AK-12
	- Has "NATO" rails to attach attachments such as optics 
	- Firemodes: Semi/Auto
	- Loadout code is w14

- Added AK-308 (w18)
    - Part of the fifth generation of Kalashnikov rifles (AK-12, AK-15, AK-19, AK-308). Designed for international export.
	- The 7.62x51mm version of the old AKM.  Shares mags with the M14
	- Around the same recoil compared to the AK-15
	- Has "NATO" rails to attach attachments such as optics 
	- Firemodes: Semi/Auto
	- Loadout code is w18

- Added RPK-16 (w19)
    - Replacement for the RPK-74. For simplicity, think of a higher capacity AK-12
	- Features a new 95 round 5.45mm drum. Loadout code for drum is m19
	- Has "NATO" rails to attach attachments such as optics 
	- Firemodes: Semi/Auto
	- Loadout code of gun is w19

- Added AK-108 (w15)
	- From the AK-100 family, known for heavily reduced recoil due to balancing system
	- AK-108 is the 5.56 version. Shares 5.56 mags with the M4A1
	- Does not have rails, so you cannot attach attachments
	- Firemodes: Semi/Burst/Auto

- Added M240 (w16) and 100 round 7.62x51mm pouch (m16)
	- FN MAG, modified for US Military. Fires 7.62x51mm.
	- Uses 100 round 7.62x51mm pouches, which has a loadout code of (m16)
	 	- The magazine is differentiable from the 200 round 5.56 pouch in that the 7.62 pouch is lighter in color.
	- Has a slower rate of fire compared to the M249
	- Has a higher recoil compared to the M249
	- Firemodes: Auto

- Added SCAR-16 (w20)
    - Textures used from https://delthor-games.itch.io/free-low-poly-weapons-pack-3. Check them out!
	- The FN SCAR is a family of gas-operated automatic rifles developed by Belgian manufacturer FN Herstal in 2004
	- Shares 5.56 mags with the M4A1
	- Has a slower rate of fire compared to the M4A1
	- Has a lower recoil compared to the M4A1
	- Firemodes: Semi/Auto

- Added SCAR-17 (w21)
    - Textures used from https://delthor-games.itch.io/free-low-poly-weapons-pack-3. Check them out!
	- The FN SCAR is a family of gas-operated automatic rifles developed by Belgian manufacturer FN Herstal in 2004
	- Shares 7.62x51mm mags with the M14
	- Has a slower rate of fire compared to the M14
	- Has a lower recoil compared to the M14
	- Firemodes: Semi/Auto

- Added UMP-9 (w22)
    - Textures used from https://adwitr.itch.io/low-poly-gun-models-ump-uzi. Check them out!
	- The Heckler & Koch UMP is a submachine gun developed and manufactured by Heckler & Koch. Heckler & Koch developed the UMP as a lighter and cheaper successor to the MP5, though both remain in production. 
	- Shares 9mm smg mags with the MP5
	- Firemodes: Semi/Burst/Auto

- Added UMP-45 (w23)
    - Textures used from https://adwitr.itch.io/low-poly-gun-models-ump-uzi. Check them out!
	- The Heckler & Koch UMP is a submachine gun developed and manufactured by Heckler & Koch. Heckler & Koch developed the UMP as a lighter and cheaper successor to the MP5, though both remain in production. 
	- Uses new 25 round .45ACP magazines. Loadout code for magazines is m23.
    - This required the.45ACP from HDBulletLib
	- Firemodes: Semi/Burst/Auto

- Added a reflex to the ACOG. 
 	- Without zooming, the reflex is active. While zooming, you switch to the magnified view.
 	- I didn't like how I was bad at aiming with the ACOG, so here goes.


TLDR of new weapons: 

Firearms used by the East:
- AK-15 (w12)
- AK-12 (w17)
- AK-19 (w14)
- AK-308 (w18)
- RPK-16 (w19), Magazine (m19)
- AK-108 (w15)

Firearms used by the West:
- M240 (w16), Magazine (m16)
- SCAR-16 (w20)
- SCAR-17 (w21)
- UMP-9 (w22)
- UMP-45 (w23), Magazine (m23)

---
The original project readme is below.
---

<p align="center">
	<img src="static/coverimage.png?raw=true">
</p>


# Bryan's Weapons

What was originally intended as a library for creating Hideous Destructor weapons has turned into a modern tactical weapons pack. These weapons come with the benefit of some modularity, allowing for weapon attachments such as scopes, muzzle, and a miscellaneous flashlight attachments. 

Demonstration video: https://youtu.be/6MUE1xlJy-s

## How to play

This mod requires GZdoom & Hideous Destructor. LZDoom is also supported though there are some UI issues.

GZDoom/LZDoom: https://zdoom.org/index

Hideous Destructor: https://forum.zdoom.org/viewtopic.php?t=12973

If you aren't using `git` you can download this repository as a ZIP via the green code button at the top of this page.

![cloneimage](static/cloneimage.png?raw=true)

Otherwise, clone the repository:

```
git clone https://github.com/abramsba/bryan-hdest-weapons.git
```

And then load this mod as you would any other Doom mod.

```
gzdoom -file "HideousDestructor" "hdest-weapons"
```

ZDL (ZDoom Launcher) is also available to help manage loading multiple wads.

https://zdoom.org/wiki/ZDL

## Credits

Programming: Me

Weapon Sprites: [Clay](https://www.artstation.com/donor_clay)

Sound Effects: [Duncan Soo](https://www.duncansoo.com/)

Player/Item Sprites: Ultra64

Play testing: Shredder, a1337spy

Special thanks to Shredder for being the Hideous Destructor consultant. 

Additional thanks to D.W. for adding minor fixes for HD-4.5.0.

Textures used in hub map taken from Kingpin texture pack on Realm667

https://realm667.com/

## Permissions

Permission is granted to reuse any content from this repository as long as you include in your credits a link back to this repository, or a copy and paste of the above text.

## Player Skin

To see list of avaliable skins, press `~` and type command `hd_skins`. The following are available:

* `us_mc`
* `BryanOperator`

<p>
	<img src="static/operator.png">
	<img src="static/usmc.png">
</p>

* `ru_vsr`
* `ru_emr`

<p>
	<img src="static/emr.png">
	<img src="static/vsr.png">
</p>

## Game Options

Options for this mod can be found in at the bottom of the default GZdoom options menu.

### Replace Mode

- None: Weapons from this mod will not spawn in levels. Gear can only be obtained via the loadout manager.
- Replace: Hideous Destructor weapon spawns will be replaced with weapons from this mod.
- Map: Weapons are only replaced at the start of the level.

WARNING: Vanilla loadouts and certain vanilla weapons will not function properly if using replace mode. This is intended to replace the default weapons entirely. It is still possible to spawn vanilla items via the loadout manager, but they will not function properly. If you want to use both weapons, play using map start or map mixed. The following items are replaced:

- Pistol with the Glock
- SMG with the MP5
- ZM66 with the M4
- Liberator with the M14
- Chaingun with the M249
- D.E.R.P. robot with the F.H. robot
- T.H.E.R.P. robot

Also note that other mods that spawn or replace actors if using "Replace" mode may continue to spawn even though they should be replaced. You'll be able to pick up these items and use them, but dropping them will trigger a replacement. 

### AI Replace Mode

There are 4 enemies available at the moment that can replace vanilla HD monsters.

- None: Enemies will not spawn. 
- Replace: Enemies will be replaced, including enemies spawning it.
- Map: Enemies are only replaced at the start of the level. 

You can adjust the chances of each enemy spawning. The enemies are:

- Scout: MP5
- Rifleman: M4
- Ranger: M14
- Shotgunner: Fauxtech Origin 12

### Sight Mode

- Full: The entire back of the sight is shown. Uses the most screen space.
- Minimal: Only the parts vital to being able to aim are shown.

### Attachment Spawn Mode

- None: Weapons when they spawn will not have any attachments other than default sights.
- Random: Weapons will spawn with random attachments. 

### Backpack Mode

- Vanilla: Wild backpacks are vanilla style random contents
- Alternative: Wild backpack contents are randomized differently

## Experimental Options

### Resource Mode

- Off: Resources & crafting workbenches will not spawn
- On: Resources will spawn randomly around the map. 2 crafting benches will appear per map.

### Weapon Mag Mode

- Off: Weapons will spawn, including ones dropped from enemies, without magazines and/or a chambered round. (Not completed).
- On: (Default) Weapons will spawn with a full mag and chambered weapon.

### Loose Mag mode

- Off: Magazines will spawn empty. (Not completed)
- On: (Default) Magazines will spawn full.

## Weapons

### Glock

<p align="center">
	<img src="graphics/gunimages/glock/glock_pickup_base.png">
	<img src="graphics/gunimages/glock/glock_pickup_silencer.png">
</p>

### MP5 & MP5 M203

<p align="center">
<img src="graphics/gunimages/mp5/none/base.png">
<img src="graphics/gunimages/mp5/low/flashlight.png">
<img src="graphics/gunimages/mp5/high/silencer.png">
<img src="graphics/gunimages/mp5/none/flashlight_silencer.png">
</p>

<p align="center">
<img src="graphics/gunimages/mp5m203/none/base.png">
<img src="graphics/gunimages/mp5m203/low/flashlight.png">
<img src="graphics/gunimages/mp5m203/high/silencer.png">
<img src="graphics/gunimages/mp5m203/none/flashlight_silencer.png">
</p>

### M4 & M4 M203

<p align="center">
<img src="graphics/gunimages/m4/carryhandle/base.png">
<img src="graphics/gunimages/m4/lowsight/flashlight.png">
<img src="graphics/gunimages/m4/other/silencer.png">
<img src="graphics/gunimages/m4/carryhandle/flashlight_silencer.png">
</p>

<p align="center">
<img src="graphics/gunimages/m4m203/carryhandle/base.png">
<img src="graphics/gunimages/m4m203/lowsight/flashlight.png">
<img src="graphics/gunimages/m4m203/other/silencer.png">
<img src="graphics/gunimages/m4m203/carryhandle/flashlight_silencer.png">
</p>

### M14

<p align="center">
<img src="graphics/gunimages/m14/none/base.png">
<img src="graphics/gunimages/m14/low/flashlight.png">
</p>
<p align="center">
<img src="graphics/gunimages/m14/high/silencer.png">
<img src="graphics/gunimages/m14/none/flashlight_silencer.png">
</p>

### Fauxtech Origin 12

<p align="center">
<img src="graphics/gunimages/fostech/none/base.png">
<img src="graphics/gunimages/fostech/high/flashlight.png">
<img src="graphics/gunimages/fostech/low/silencer.png">
<img src="graphics/gunimages/fostech/high/flashlight_silencer.png">
</p>

### M249

<p align="center">
<img src="graphics/gunimages/m249/none/base.png">
<img src="graphics/gunimages/m249/low/flashlight.png">
<img src="graphics/gunimages/m249/high/silencer.png">
<img src="graphics/gunimages/m249/none/flashlight_silencer.png">
</p>

### M107

<p align="center">
<img src="graphics/gunimages/m107/high/base.png">
</p>

### RPG

<p align="center">
<img src="graphics/gunimages/rpg/base.png">
</p>

### AKM

<p align="center">
<img src="graphics/gunimages/akm/base.png">
</p>

### AKS74u

<p align="center">
<img src="graphics/gunimages/aks74u/base.png">
</p>

### Uzi

<p align="center">
<img src="graphics/gunimages/uzi/base.png">
<img src="graphics/gunimages/uzi/silencer.png">
</p>

## Ammo

Each weapon has its own magazine/drum/pouch. The Glock and MP5 are chambered in the the default Hideous Destructor 9mm bullet. The Fauxtech Origin also reuses the default Hideous Destructor shotgun shells. Ammo for the M203 uses the default rocket grenade ammo as well. 

<p>
	<img src="graphics/newpickup/556_Ammo_Box.png">
	<img src="graphics/newpickup/762_Ammo_Box.png">
	<img src="graphics/newpickup/50bmg_Ammo_Box.png">
	<img src="graphics/newpickup/545_Ammo_Box.png">
	<img src="graphics/newpickup/762rus_Ammo_Box.png">
	<img src="graphics/newpickup/Ammo_Container.png">
</p>

- Glock magazine (9mm): 15 rounds
- MP5 magazine (9mm): 30 rounds
- M4 magazine (5.56mm): 30 rounds
- M14 magazine (7.62mm): 20 rounds
- Fauxtech drum (12 gauge): 20 shells
- M249 pouch (5.56mm): 200 rounds
- M107 magazine (.50 cal) 10 rounds
- AKM magazine (7.62mm): 30 rounds
- AKS74u magazine (5.45mm): 30 rounds
- Uzi magazine (9mm): 30 rounds

For the M249 pouch, a reloading tool is available. It is similar to the 7mm reloader. It needs an empty M249 magazine and loose 5.56 rounds.

## Using Attachments

Attachments will either be found in backpacks or already equipped on weapons dropped by enemies. An attachment must be compatible with the weapon to be able to attach it. To swap an attachment, simply use an attachment item. It will remove the attachment already occupying the slot, place it back in your inventory, and attach the item just used. 

There is a keybind available for removing each attachment in the options for opening an attachment manager.

## Loadout Manager

Weapons are configured based on the follow syntax: `w## ba# bs# bm#`. The values for input are shown below.

- `w##` is the weapon reference number
- `ba#` is the muzzle attachment reference number
- `bs#` is the sight attachment reference number
- `bm#` is the misc. attachment reference number

It's possible via the loadout manager to place attachments on weapons that otherwise wouldn't be supported. This is a known issue. You can remove the attachment, but you won't be able to put it back on later. Putting chokes on weapons other than the Fauxtech Origin will have no effect.

Magazines for weapons correspond to their weapon number, except for the M203 weapon variants. 

- `m01`: Glock magazine

<p><img src="sprites/glock/bglockmag.png"></p>

- `m02`: MP5 magazine

<p><img src="graphics/mags/mp5clip.png"></p>

- `m03`: M4 magazine

<p><img src="sprites/m4/m4clip.png"></p>

- `m04`: M14 magazine

<p><img src="sprites/m14/bm14clip.png"></p>

- `m05`: Fauxtech Origin drum

<p><img src="sprites/fostech/pfosmag.png"></p>

- `m06`: M249 pouch

<p><img src="sprites/mf240/bm249clip.png"></p>

- `m10`: M107 magazine

<p><img src="graphics/mags/m107full.png"></p>

- `m11`: AKS74u magazine

<p><img src="graphics/mags/ak7clip.png"></p>

- `m12`: AKM magazine

<p><img src="graphics/mags/akmclip.png"></p>

- `m13`: Uzi magazine

<p><img src="graphics/mags/uziclip.png"></p>

Note: The M4 and Fauxtech Origin by default have no rear sight. You have to pick one yourself or you will only see the front sight image.

### Weapon IDs

- `w01`: Glock
- `w02`: MP5
- `w03`: M4
- `w04`: M14
- `w05`: Fauxtech Origin
- `w06`: M249
- `w07`: M4 M203
- `w08`: MP5 M203
- `w09`: RPG
- `w10`: M107
- `w11`: AKS74u
- `w12`: AKM
- `w13`: Uzi

### Muzzle IDs

- `ba1`: 5.56mm suppressor
- `ba2`: 5.56mm flash suppressor
- `ba3`: 9mm suppressor
- `ba4`: 7.62mm suppressor
- `ba5`: Fauxtech Silencerr
- `ba6`: Fauxtech Improved Choke
- `ba7`: Fauxtech Modified Choke
- `ba8`: Fauxtech Full Choke

### Sight IDs

- `bs1`: M4 Rear ironsight

<p><img src="graphics/newpickup/Sight_M4.png"></p>

- `bs2`: M4 Carryhandle

<p><img src="graphics/newpickup/Sight_Handle.png"></p>

- `bs3`: Fauxtech Origin Diamond Sight

<p><img src="graphics/newpickup/Sight_Fostech.png"></p>

- `bs4`: ACOG

<p><img src="graphics/newpickup/Attachment ACOG.png"></p>

- `bs5`: Red dot

<p><img src="graphics/newpickup/Attachment Red Dot.png"></p>

- `bs6`: Holo sight

<p><img src="graphics/newpickup/Attachment Holo.png"></p>

- `bs7`: Reflex sight

<p><img src="graphics/newpickup/Attachment Reflex.png"></p>

- `bs8`: 10x Scope

<p><img src="graphics/newpickup/Attachment Scope.png"></p>

### Misc IDs

- `bm1`: Flashlight attachment

### Attachment Loadout IDs

These are for adding attachments as loose items in your inventory if you plan to switch between multiple sights.

- `m4i`: M4 default rear sight
- `m4c`: M4 carryhandle
- `dia`: Fauxtech diamond sight
- `acg`: ACOG
- `rdt`: Red-dot Sight
- `hrd`: Holo sight
- `rfr`: Reflex sight
- `s10`: 10x Sight

- `sl5`: 5.56 silencer
- `sl7`: 7.62 silencer
- `sl9`: 9mm silencer
- `slf`: Fauxtech Silencer
- `ck1`: Fauxtech improved choke
- `ck2`: Fauxtech modified choke
- `ck3`: Fauxtech full choke

- `gfl`: Misc flashlight attachment

### Misc Loadout IDs

- `r04`: M249 pouch reloader
- `fhr`: F.H. robot
- `thp`: Tactical H.E.R.P.

### Crafting IDs

- `bcr`: Ball crafter
- `ccr`: Case crafter
- `asm`: Bullet Assembler
- `rsm`: Rocket Assembler
