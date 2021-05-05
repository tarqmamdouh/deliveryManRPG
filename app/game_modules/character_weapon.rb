module GameModules
    class CharacterWeapon
        attr_reader :weapon

        def initialize
            # Draw weapons
            DrawingEngine.draw(Loader.db_ascii_model(Environment, 'weapon_selection_screen'))
            
            # Select one
            GameMenu.select("choose your hero weapon:", {
                "Rifle": method(:rifle),
                "Axe": method(:axe),
                "Katana Sword": method(:katana)
            })
        end
    
        def rifle
            @weapon = find_weapon('rifle')
        end
    
        def axe
            @weapon = find_weapon('axe')
        end
    
        def katana
            @weapon = find_weapon('katana')
        end
    
        def find_weapon(name)
            Weapon.find_by(name: name)
        end
    end
end
