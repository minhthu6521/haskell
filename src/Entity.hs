module Entity where
data Client = GovOrg     String
            | Company    String Integer Person String
            | Individual Person Bool
            deriving Show
data Person = Person String String Gender 
            deriving Show 

data Gender = Male | Female | Unknown
            deriving Show 

data Manufacturer =  Manufacturer String Integer String String 
                 deriving Show 

data TimeMachine = TimeMachine Manufacturer Integer String Bool Float 
                 deriving Show 


clientName :: Client -> String
-- clientName client = case client of
--                       GovOrg  name                -> name
--                       Company name id person resp -> name
--                       Individual person ads       ->
--                           case person of
--                             Person fNm lNm gender -> fNm ++ " " ++ lNm
clientName client = case client of
                      GovOrg  name       -> name
                      Company name _ _ _ -> name
                      Individual (Person fNm lNm _) _ -> fNm ++ " " ++ lNm


companyName :: Client -> Maybe String
companyName client = case client of
                       Company name _ _ _ -> Just name
                       _                  -> Nothing

fibonacci :: Integer -> Integer
fibonacci n = case n of
                0 -> 0
                1 -> 1
                _ -> fibonacci (n-1) + fibonacci (n-2)


f :: Client -> String
f client = case client of
             Company _ _ (Person name _ _) "Boss" -> name ++ " is the boss"
             _                                  -> "There is no boss"

clientGender :: Client -> Maybe Gender
clientGender client = case client of
                        Company _ _ (Person _ _ gender) _ -> Just gender 
                        Individual (Person _ _ gender) _  -> Just gender 
                        _                                 -> Nothing 


clients :: [Client]
clients = [Individual (Person "John" "Snow" Male) False, GovOrg "NASA", Individual (Person "Emliy" "Smith" Female) True]
 

  
                                                                